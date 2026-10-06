import 'package:get/get.dart';

import '../screens/view_investment_details_screen.dart';

class InvestorDetailsController extends GetxController{

  void clickInvestmentDetails() {
    Get.to(() => ViewInvestmentDetailsScreen());
  }

}