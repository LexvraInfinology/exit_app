//
// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// class ChatMessage {
//   final String id;
//   final String senderId;
//   final String senderName;
//   final String text;
//   final DateTime timestamp;
//   final bool isMe;
//   final MessageStatus status;
//
//   ChatMessage({
//     required this.id,
//     required this.senderId,
//     required this.senderName,
//     required this.text,
//     required this.timestamp,
//     required this.isMe,
//     this.status = MessageStatus.sent,
//   });
//
//   factory ChatMessage.fromJson(Map<String, dynamic> json, {required String currentUserId}) {
//     final senderId = json['sender_id']?.toString() ?? '';
//     return ChatMessage(
//       id: json['id']?.toString() ?? DateTime.now().millisecondsSinceEpoch.toString(),
//       senderId: senderId,
//       senderName: json['sender_name']?.toString() ?? '',
//       // Actual server sends the text under "body", not "message"/"text"
//       text: json['body']?.toString() ?? json['message']?.toString() ?? '',
//       timestamp: DateTime.tryParse(json['timestamp']?.toString() ?? '') ?? DateTime.now(),
//       isMe: senderId == currentUserId,
//       status: MessageStatus.sent,
//     );
//   }
//
//   ChatMessage copyWith({MessageStatus? status}) {
//     return ChatMessage(
//       id: id,
//       senderId: senderId,
//       senderName: senderName,
//       text: text,
//       timestamp: timestamp,
//       isMe: isMe,
//       status: status ?? this.status,
//     );
//   }
//
//   /// Matches the real server protocol — only "body" is sent.
//   Map<String, dynamic> toSendJson() {
//     return {
//       'body': text,
//     };
//   }
// }
//
// enum MessageStatus { sending, sent, failed }
//
// enum ChatConnectionState { connecting, connected, disconnected, error }
//
// // ============================================================================
// // CONTROLLER
// // ============================================================================
//
// class ChatController extends GetxController {
//   ChatController({required this.recipientId, required this.currentUserId});
//
// ]  final String recipientId;
//   final String currentUserId;
//
//   WebSocketChannel? _channel;
//   StreamSubscription? _subscription;
//
//   final RxList<ChatMessage> messages = <ChatMessage>[].obs;
//   final Rx<ChatConnectionState> connectionState = ChatConnectionState.connecting.obs;
//   final RxBool isLoadingHistory = false.obs;
//   final RxBool isSending = false.obs;
//   final RxBool isTyping = false.obs; // remote user typing, if backend supports it
//
//   final TextEditingController messageController = TextEditingController();
//   final ScrollController scrollController = ScrollController();
//
//   Timer? _reconnectTimer;
//   int _reconnectAttempts = 0;
//   static const int _maxReconnectAttempts = 5;
//
//   static const String _wsBaseUrl = 'ws://127.0.0.1:8000';
//
//   @override
//   void onInit() {
//     super.onInit();
//     connect();
//   }
//
//   Future<void> connect() async {
//     try {
//       connectionState.value = ChatConnectionState.connecting;
//
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//
//       final uri = Uri.parse('$_wsBaseUrl/ws/messages/$recipientId/?token=$token');
//       _channel = WebSocketChannel.connect(uri);
//
//       connectionState.value = ChatConnectionState.connected;
//       _reconnectAttempts = 0;
//
//       _subscription = _channel!.stream.listen(
//         _onSocketData,
//         onError: _onError,
//         onDone: _onDisconnected,
//       );
//     } catch (e) {
//       print('object $e');
//       connectionState.value = ChatConnectionState.error;
//       _scheduleReconnect();
//     }
//   }
//
//   void _onSocketData(dynamic rawMessage) {
//     try {
//       final Map<String, dynamic> data = jsonDecode(rawMessage as String);
//       final String type = data['type']?.toString() ?? '';
//
//       switch (type) {
//         case 'ready':
//           print('Chat ready, recipient_id: ${data['recipient_id']}');
//           break;
//
//         case 'message':
//         case 'chat_message':
//           final message = ChatMessage.fromJson(data, currentUserId: currentUserId);
//           messages.add(message);
//           _scrollToBottom();
//           break;
//
//         default:
//           print('Unhandled socket event: $data');
//       }
//     } catch (e) {
//       print('object $e');
//     }
//   }
//
//   void _onError(dynamic error) {
//     print('object $error');
//     connectionState.value = ChatConnectionState.error;
//     _scheduleReconnect();
//   }
//
//   void _onDisconnected() {
//     connectionState.value = ChatConnectionState.disconnected;
//     _scheduleReconnect();
//   }
//
//   void _scheduleReconnect() {
//     if (_reconnectAttempts >= _maxReconnectAttempts) return;
//     _reconnectAttempts++;
//
//     _reconnectTimer?.cancel();
//     _reconnectTimer = Timer(Duration(seconds: 2 * _reconnectAttempts), () {
//       connect();
//     });
//   }
//
//   void disconnect() {
//     _reconnectTimer?.cancel();
//     _subscription?.cancel();
//     _channel?.sink.close();
//     connectionState.value = ChatConnectionState.disconnected;
//   }
//
//   Future<void> sendMessage() async {
//     final text = messageController.text.trim();
//     if (text.isEmpty) return;
//
//     final tempId = DateTime.now().millisecondsSinceEpoch.toString();
//     final optimisticMessage = ChatMessage(
//       id: tempId,
//       senderId: currentUserId,
//       senderName: 'You',
//       text: text,
//       timestamp: DateTime.now(),
//       isMe: true,
//       status: MessageStatus.sending,
//     );
//
//     messages.add(optimisticMessage);
//     messageController.clear();
//     _scrollToBottom();
//
//     try {
//       isSending.value = true;
//
//       if (connectionState.value != ChatConnectionState.connected || _channel == null) {
//         throw Exception('Not connected');
//       }
//
//       _channel!.sink.add(jsonEncode(optimisticMessage.toSendJson()));
//
//       final index = messages.indexWhere((m) => m.id == tempId);
//       if (index != -1) {
//         messages[index] = optimisticMessage.copyWith(status: MessageStatus.sent);
//       }
//     } catch (e) {
//       print('object $e');
//       final index = messages.indexWhere((m) => m.id == tempId);
//       if (index != -1) {
//         messages[index] = optimisticMessage.copyWith(status: MessageStatus.failed);
//       }
//       Get.snackbar(
//         'Message Failed',
//         'Could not send message. Tap to retry.',
//         snackPosition: SnackPosition.TOP,
//         backgroundColor: Colors.black,
//         colorText: Colors.white,
//       );
//     } finally {
//       isSending.value = false;
//     }
//   }
//
//   Future<void> retryMessage(String messageId) async {
//     final index = messages.indexWhere((m) => m.id == messageId);
//     if (index == -1) return;
//
//     final failedMessage = messages[index];
//     messages[index] = failedMessage.copyWith(status: MessageStatus.sending);
//
//     try {
//       if (connectionState.value != ChatConnectionState.connected || _channel == null) {
//         throw Exception('Not connected');
//       }
//       _channel!.sink.add(jsonEncode(failedMessage.toSendJson()));
//       messages[index] = failedMessage.copyWith(status: MessageStatus.sent);
//     } catch (e) {
//       print('object $e');
//       messages[index] = failedMessage.copyWith(status: MessageStatus.failed);
//     }
//   }
//
//   Future<void> loadChatHistory(String historyApiUrl) async {
//     try {
//       isLoadingHistory.value = true;
//
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//
//       _scrollToBottom();
//     } catch (e) {
//       print('object $e');
//     } finally {
//       isLoadingHistory.value = false;
//     }
//   }
//
//   void _scrollToBottom() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (scrollController.hasClients) {
//         scrollController.animateTo(
//           scrollController.position.maxScrollExtent,
//           duration: const Duration(milliseconds: 250),
//           curve: Curves.easeOut,
//         );
//       }
//     });
//   }
//
//   @override
//   void onClose() {
//     disconnect();
//     messageController.dispose();
//     scrollController.dispose();
//     super.onClose();
//   }
// }