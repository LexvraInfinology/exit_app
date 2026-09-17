import 'package:get/get.dart';

class NotificationController extends GetxController{
  RxBool newFundingRequests = true.obs;
  RxBool founderInterest = true.obs;
  RxBool messagesConnections = true.obs;
  RxBool portfolioUpdates = true.obs;

  RxBool pushNotifications = true.obs;
  RxBool emailNotifications = true.obs;
  RxBool isLoading = false.obs;
  RxString title = ''.obs;
  RxInt count = 0.obs;

  void toggleNewFundingRequests(bool value) {
    newFundingRequests.value = value;
  }

  void toggleFounderInterest(bool value) {
    founderInterest.value = value;
  }

  void toggleMessagesConnections(bool value) {
    messagesConnections.value = value;
  }

  void togglePortfolioUpdates(bool value) {
    portfolioUpdates.value = value;
  }

  void togglePushNotifications(bool value) {
    pushNotifications.value = value;
  }

  void toggleEmailNotifications(bool value) {
    emailNotifications.value = value;
  }

  final expandedIndex = (-1).obs;

  void toggleItem(int index) {
    if (expandedIndex.value == index) {
      expandedIndex.value = -1;
    } else {
      expandedIndex.value = index;
    }
  }

  bool isExpanded(int index) {
    return expandedIndex.value == index;
  }

}