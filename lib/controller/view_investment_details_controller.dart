import 'package:exit_app/constants/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ViewInvestmentDetailsController extends GetxController{

  final RxString selectedPeriod = '1Y'.obs;

  final List<String> periods = [
    '1M',
    '3M',
    '6M',
    '1Y',
    'All',
  ];

  void changePeriod(String period) {
    selectedPeriod.value = period;
  }

  final String companyName = 'NovaNest';
  final String industry = 'FinTech';
  final String location = 'Bengaluru';
  final String stage = 'Seed';

  final String description =
      '"Building next-gen digital lending infrastructure"';

  final String invested = '₹25L';
  final String ownership = '5%';
  final String currentValuation = '₹5.2Cr';
  final String returns = '+₹7.1L';
  final String returnPercentage = '↑ 4.4%';
  final String investedOn = '12 Apr 2025';
  final String round = 'Seed';

  final List<InvestmentUpdate> updates = [
    InvestmentUpdate(
      date: '28 Aug 2025',
      text: '“Expanded operations to 3 new cities.”',
    ),
    InvestmentUpdate(
      date: '15 Jul 2025',
      text: '“Crossed 50,000 active users milestone.”',
    ),
    InvestmentUpdate(
      date: '02 Jun 2025',
      text: '“Partnered with HDFC for co-lending.”',
    ),
  ];

  final List<InvestmentDocument> documents = [
    InvestmentDocument(
      title: 'Investment Agreement',
      details: 'Apr 2025 · PDF · 2.4 MB',
    ),
    InvestmentDocument(
      title: 'Cap Table Q2 2025',
      details: 'Jun 2025 · XLSX · 1.1 MB',
    ),
    InvestmentDocument(
      title: 'Quarterly Report Q1 2025',
      details: 'May 2025 · PDF · 4.8 MB',
    ),
  ];
  void downloadDocument(InvestmentDocument document) {
    Get.snackbar(
      'Download',
      '${document.title} download started',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.blackColor,
      colorText: AppColors.whiteColor,
      margin: const EdgeInsets.all(16),
    );
  }

  void editInvestment() {

  }


}

class InvestmentUpdate {
  final String date;
  final String text;

  InvestmentUpdate({
    required this.date,
    required this.text,
  });
}

class InvestmentDocument {
  final String title;
  final String details;

  InvestmentDocument({
    required this.title,
    required this.details,
  });
}