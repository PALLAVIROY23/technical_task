import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:technical_task/app/routes/app_pages.dart';

class VerifyOtpScreenController extends GetxController {
  //TODO: Implement VerifyOtpScreenController
  var pinFilled = false.obs;
  var pin = ''.obs;

  void updatePin(String value) {
    pin.value = value;
  }
  void validateAndProceed() {
    if (pin.value.isEmpty || pin.value.length < 6) {
      EasyLoading.showError("Complete your OTP");
    } else {
      EasyLoading.showSuccess("OTP Verified!");
      Get.toNamed(Routes.LOGIN_SCREEN);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void increment() => count.value++;
}
