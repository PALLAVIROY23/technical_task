import 'package:get/get.dart';
import 'package:technical_task/api/api_controller.dart';

import '../controllers/sign_up_screen_controller.dart';

class SignUpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpScreenController>(
      () => SignUpScreenController(apiController: ApiController()),
    );
  }
}
