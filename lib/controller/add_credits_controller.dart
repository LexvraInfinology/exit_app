import 'package:get/get.dart';

class CreditPack {
  final int credits;
  final String subtitle;
  final String price;
  final bool isPopular;

  CreditPack({
    required this.credits,
    required this.subtitle,
    required this.price,
    this.isPopular = false,
  });
}

class AddCreditsController extends GetxController {
  int creditsLeft = 10;
  int totalCredits = 50;
  int selectedPackIndex = 0;
  bool isProcessingPayment = false;

  final List<CreditPack> packs = [
    CreditPack(
      credits: 50,
      subtitle: 'Perfect if you\'re looking to make a few more connections.',
      price: '₹2,999',
      isPopular: true,
    ),
    CreditPack(
      credits: 100,
      subtitle: 'Great for active networking and multiple interactions.',
      price: '₹3,999',
    ),
    CreditPack(
      credits: 500,
      subtitle: 'Best for serious deal flow and long-term growth.',
      price: '₹4,999',
    ),
  ];

  double get creditsProgress =>
      totalCredits == 0 ? 0.0 : (totalCredits - creditsLeft) / totalCredits;

  int get usedCredits => totalCredits - creditsLeft;

  CreditPack get selectedPack => packs[selectedPackIndex];

  void selectPack(int index) {
    selectedPackIndex = index;
    update();
  }

  void onViewUsage() {

  }

  Future<void> proceedToPay() async {
    if (isProcessingPayment) return;

    try {
      isProcessingPayment = true;
      update();


      Get.back();
    } finally {
      isProcessingPayment = false;
      update();
    }
  }

  String currentPlanName = 'Launch Plan';
  bool isChangingPlan = false;

  Future<void> changePlan({
    required String newPlanName,
    required String newMonthlyPrice,
  }) async {
    if (isChangingPlan) return;

    try {
      isChangingPlan = true;
      update();

      // final success = await apiServices.changePlanApi(planName: newPlanName);

      currentPlanName = newPlanName;

      Get.back(); // close the bottom sheet
      Get.snackbar(
        'Plan Updated',
        'You are now on the $newPlanName',
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isChangingPlan = false;
      update();
    }
  }
}