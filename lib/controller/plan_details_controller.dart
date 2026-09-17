import 'package:exit_app/screens/choose_plan_screen.dart';
import 'package:get/get.dart';

class PlanDetailsController extends GetxController {
  void clickManagePlan() {
    Get.to(() => ChoosePlanScreen());
  }
}
