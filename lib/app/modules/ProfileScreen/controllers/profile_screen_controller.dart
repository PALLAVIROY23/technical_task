import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  //TODO: Implement ProfileScreenController
  var username = 'himanshukumar123'.obs;
  var name = 'Himanshu'.obs;
  var mobileNumber = '8899556622'.obs;
  var emailAddress = 'himanshu@gmail.com'.obs;
  var aadhaarMasked = '********'.obs;
  var referralCode = 'm7fny6osn'.obs;
  var isMobileVerified = true.obs;
  var isEmailVerified = true.obs;


  void updateAadhaar(String newAadhaar) {
    aadhaarMasked.value = newAadhaar;
  }
  void shareReferralCode() {
    // Add sharing logic
    print('Shared Referral Code: ${referralCode.value}');
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
