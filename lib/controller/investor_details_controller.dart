import 'package:get/get.dart';

import '../screens/dashoard_screen/founder_dashboard/view_all_investor_screen.dart';
import '../screens/view_investment_details_screen.dart';

class InvestorDetailsController extends GetxController{

  void clickInvestmentDetails() {
    Get.to(() => ViewInvestmentDetailsScreen());
  }



}