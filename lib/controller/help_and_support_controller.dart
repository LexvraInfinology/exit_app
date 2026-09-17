import 'package:get/get.dart';

class HelpAndSupportController extends GetxController{
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