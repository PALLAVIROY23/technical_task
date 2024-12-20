import 'package:get/get.dart';

import '../controllers/verify_otp_screen_controller.dart';

class VerifyOtpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyOtpScreenController>(
      () => VerifyOtpScreenController(),
    );
  }
}
