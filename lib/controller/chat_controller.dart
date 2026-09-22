import 'dart:async';
import 'dart:convert';

import 'package:exit_app/api_utils/api_services.dart';
import 'package:exit_app/models/chat_model.dart';
import 'package:exit_app/models/connection_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

enum MessageStatus {
  sending,
  sent,
  failed,
}

enum ChatConnectionState {
  connecting,
  connected,
  disconnected,
  error,
}

class ChatController extends GetxController {
  ChatController({
    required this.conversationId,
    required this.recipientId});


  final int recipientId;
  final String? conversationId;
  int? currentUserId;


  final ApiServices apiServices = ApiServices();


  final TextEditingController messageController =
  TextEditingController();

  final ScrollController scrollController =
  ScrollController();


  final RxList<ChatMessage> messages = <ChatMessage>[].obs;

  final Rx<ChatConnectionState> connectionState =
      ChatConnectionState.disconnected.obs;

  final RxBool isCreatingConnection = false.obs;
  final RxBool isLoadingHistory = false.obs;
  final RxBool isSending = false.obs;
  final RxBool isTyping = false.obs;


  WebSocketChannel? _channel;
  StreamSubscription? _subscription;

  Timer? _reconnectTimer;

  int _reconnectAttempts = 0;

  static const int _maxReconnectAttempts = 5;

  static const String _wsBaseUrl =
      'wss://e211-2401-4900-1c2a-4731-11dd-dc04-5701-169f.ngrok-free.app';

  int? _connectionId;


  bool _manualDisconnect = false;


  @override
  void onInit() {
    super.onInit();
    _initChat();
  }

  @override
  void onClose() {
    _manualDisconnect = true;

    _reconnectTimer?.cancel();
    _subscription?.cancel();
    _channel?.sink.close();

    messageController.dispose();
    scrollController.dispose();

    super.onClose();
  }

  Future<void> _initChat() async {
    try {
      isCreatingConnection.value = true;

      final ConnectionResponse? response = await apiServices.createConnectionApi(
        founderId: recipientId,
      );

      if (response == null) {
        debugPrint('Connection API returned null');
        return;
      }else{
        _connectionId = response.data.id;
        currentUserId = recipientId == response.data.investorId ? response.data.founderId:response.data.investorId;
        if(conversationId != null && currentUserId != null){
          getChatHistory(conversationId!,currentUserId!);
        }
      }



      debugPrint(
        'Connection created/found: $_connectionId',
      );

      if (!response.data.canMessage) {
        debugPrint('Messaging is not allowed');
        return;
      }

      await connect();
    } catch (e, stackTrace) {
      debugPrint('Init Chat Error: $e');
      debugPrintStack(stackTrace: stackTrace);
    } finally {
      isCreatingConnection.value = false;
    }
  }


  Future<void> connect() async {
    if (_connectionId == null) {
      debugPrint('Cannot connect: connection ID is null');
      return;
    }

    if (connectionState.value == ChatConnectionState.connected) {
      debugPrint('WebSocket already connected');
      return;
    }

    try {
      _manualDisconnect = false;

      _reconnectTimer?.cancel();

      connectionState.value =
          ChatConnectionState.connecting;

      final token = Get.find<SharedPreferences>().getString('token');

      if (token == null || token.isEmpty) {
        throw Exception('Authentication token not found');
      }

      final uri = Uri.parse(
        '$_wsBaseUrl/ws/messages/$recipientId/'
            '?token=$token',
      );

      debugPrint('WebSocket URL: $uri');

      await _subscription?.cancel();
      await _channel?.sink.close();

      _channel = WebSocketChannel.connect(uri);

      _subscription = _channel!.stream.listen(
        _onSocketData,
        onError: _onError,
        onDone: _onDisconnected,
        cancelOnError: false,
      );

      debugPrint('WebSocket connecting...');
    } catch (e, stackTrace) {
      debugPrint('WebSocket Connect Error: $e');
      debugPrintStack(stackTrace: stackTrace);

      connectionState.value =
          ChatConnectionState.error;

      _scheduleReconnect();
    }
  }


  void _onSocketData(dynamic rawMessage) {
    try {
      debugPrint('WebSocket Received: $rawMessage');

      if (rawMessage is! String) {
        debugPrint('Unexpected WebSocket data type');
        return;
      }

      final decoded = jsonDecode(rawMessage);

      if (decoded is! Map<String, dynamic>) {
        debugPrint('Invalid WebSocket response');
        return;
      }

      final type = decoded['type']?.toString() ?? '';

      switch (type) {
        case 'ready':
          _handleReady(decoded);
          break;

        case 'message':
        case 'chat_message':
          _handleIncomingMessage(decoded);
          break;

        default:
          debugPrint(
            'Unhandled socket event: $decoded',
          );
      }
    } catch (e, stackTrace) {
      debugPrint('Socket Data Error: $e');
      debugPrintStack(stackTrace: stackTrace);
    }
  }


  void _handleReady(Map<String, dynamic> data) {
    connectionState.value =
        ChatConnectionState.connected;

    _reconnectAttempts = 0;

    debugPrint(
      'Chat ready: ${data['recipient_id']}',
    );
  }


  void _handleIncomingMessage(
      Map<String, dynamic> data,
      ) {
    try {
      final message = ChatMessage.fromJson(
        data,
        currentUserId: currentUserId??1,
      );

      messages.add(message);

      _scrollToBottom();
    } catch (e) {
      debugPrint(
        'Message Parse Error: $e',
      );
    }
  }


  Future<void> sendMessage() async {
    final text = messageController.text.trim();

    if (text.isEmpty) return;

    if (connectionState.value !=
        ChatConnectionState.connected ||
        _channel == null) {
      _showMessageError('Not connected to chat');
      return;
    }

    try {
      isSending.value = true;

      final message = {
        'body': text,
      };

      _channel!.sink.add(
        jsonEncode(message),
      );

      messageController.clear();

      _scrollToBottom();

      debugPrint(
        'Message Sent: $message',
      );
    } catch (e, stackTrace) {
      debugPrint(
        'Send Message Error: $e',
      );

      debugPrintStack(
        stackTrace: stackTrace,
      );

      _showMessageError(
        'Could not send message. Tap to retry.',
      );
    } finally {
      isSending.value = false;
    }
  }


  void _onError(dynamic error) {
    debugPrint(
      'WebSocket Error: $error',
    );

    connectionState.value =
        ChatConnectionState.error;

    _scheduleReconnect();
  }


  void _onDisconnected() {
    debugPrint(
      'WebSocket Disconnected',
    );

    if (_manualDisconnect) {
      connectionState.value =
          ChatConnectionState.disconnected;

      return;
    }

    connectionState.value =
        ChatConnectionState.disconnected;

    _scheduleReconnect();
  }


  void _scheduleReconnect() {
    if (_manualDisconnect) return;

    if (_reconnectAttempts >=
        _maxReconnectAttempts) {
      debugPrint(
        'Maximum reconnect attempts reached',
      );

      connectionState.value =
          ChatConnectionState.error;

      return;
    }

    if (_reconnectTimer?.isActive ?? false) {
      return;
    }

    _reconnectAttempts++;

    final seconds =
        2 * _reconnectAttempts;

    debugPrint(
      'Reconnecting in $seconds seconds...',
    );

    _reconnectTimer = Timer(
      Duration(seconds: seconds),
      connect,
    );
  }


  Future<void> disconnect() async {
    _manualDisconnect = true;

    _reconnectTimer?.cancel();

    await _subscription?.cancel();
    _subscription = null;

    await _channel?.sink.close();
    _channel = null;

    connectionState.value =
        ChatConnectionState.disconnected;

    debugPrint(
      'WebSocket manually disconnected',
    );
  }

  Future<void> getChatHistory(String conversationId,int currentUserId) async {
    if (_connectionId == null) {
      debugPrint('Get History: Conversation ID is null');
      return;
    }

    try {
      isLoadingHistory.value = true;

      final response = await apiServices.getChatHistoryApi(
        conversationId: conversationId,
        currentUserId: currentUserId,
      );

      if (response == null) {
        debugPrint('Get History: API response is null');
        return;
      }
      messages.assignAll(response.data.results);
      debugPrint(
        'Chat History Loaded: ${messages.length} messages',
      );
      _scrollToBottom();
    } catch (e, stackTrace) {
      debugPrint('Get Chat History Error: $e');
      debugPrintStack(stackTrace: stackTrace);
    } finally {
      isLoadingHistory.value = false;
    }
  }


  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!scrollController.hasClients) {
        return;
      }

      final position =
          scrollController.position;

      scrollController.animateTo(
        position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 250,
        ),
        curve: Curves.easeOut,
      );
    });
  }


  void _showMessageError(String message) {
    Get.snackbar(
      'Message Failed',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.black,
      colorText: Colors.white,
    );
  }
}