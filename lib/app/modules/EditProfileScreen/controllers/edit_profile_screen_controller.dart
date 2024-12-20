import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreenController extends GetxController {
  //TODO: Implement EditProfileScreenController
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final stateController = TextEditingController();
  var userType = " ".obs;

  var selectedGender = 'Male'.obs;


  void updateProfile() {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String state = stateController.text;
    String gender = selectedGender.value;


    if (firstName.isEmpty || lastName.isEmpty || state.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all the fields',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }


    print('Profile Updated: $firstName $lastName, $gender, $state');
    Get.snackbar(
      'Success',
      'Profile updated successfully!',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
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
