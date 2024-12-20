import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:technical_task/api/api_controller.dart';
import 'package:technical_task/app/modules/SignUpScreen/extension/getProfessionExtensions.dart';

import '../../../routes/app_pages.dart';
import '../model/getProfession.model.dart';
import '../model/signUp.model.dart';

class SignUpScreenController extends GetxController {
  ApiController apiController;
  SignUpScreenController({required this.apiController});

  var userType = ''.obs;
  var isTermsAccepted = false.obs;
  var isAgeConfirmed = false.obs;
  var areCheckboxesEnabled = false.obs; // For enabling/disabling checkboxes
  var selectedProfession = ''.obs;
  var selectedProfessionId = 0.obs;
  var professionList = <GetProfessionApi>[].obs;
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController professionId = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchProfessionList();
  }

  Future<void> fetchProfessionList() async {
    EasyLoading.show(status: "Loading...");
    try {
      var professionData = await apiController.fetchProfessionListApi();


      if (professionData.isNotEmpty) {
        professionList.value = professionData;


        showProfessionDialog();
      } else {
        EasyLoading.showError("No professions available.");
        print("PRINT ERROR: No professions found");
      }
    } catch (e) {

      print("Error occurred while fetching profession list: $e");
      EasyLoading.showError("An unexpected error occurred: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }


  void showProfessionDialog() {
    Get.dialog(
      AlertDialog(
        title: Text("Select Profession"),
        content: SingleChildScrollView(
          child: Column(
            children: professionList.map((profession) {
              return ListTile(
                title: Text(profession.name ?? 'Unknown'),
                onTap: () {
                  selectedProfession.value = profession.name ?? 'Unknown';
                  selectedProfessionId.value = profession.id ?? 0;

                  Get.back();
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }


  void validateAndSubmit() {
    areCheckboxesEnabled.value = true;


print("print the statement${professionId.text} print the id ${selectedProfessionId}");
    if (formKey.currentState!.validate()) {

      if (!isTermsAccepted.value) {
        EasyLoading.showError("You must agree to the Terms and Conditions");
        return;
      }

      if (!isAgeConfirmed.value) {
        EasyLoading.showError("You must confirm your age");
        return;
      }
      if (userType.isEmpty) {
        EasyLoading.showError("Please select your user type");
        return;
      }


      EasyLoading.showSuccess("Sign Up Successful");
      signUpUser(
        email: email.text.trim(),
        password: password.text.trim(),
        phone: mobileNumber.text.trim(),
        name: name.text.trim(),
        profession: userType != "Vendor"
            ? selectedProfession.toString()
            : selectedProfessionId.toString(),
        userType: userType.trim(),
      );

    }
  }


  signUpUser({required String email, required String password, required String phone, required String name, required String profession,required String userType}) async {
    EasyLoading.show(status: "Logging in...");
    try {
      SignUpApi response = await apiController.fetchSignup(
        email: email,
        password: password,
        phone: phone,
        name: name,
        profession: profession, userType: userType,
      );
      EasyLoading.dismiss();
      if (response.message == "User registered successfully") {
        Get.offNamed(Routes.LOGIN_SCREEN);
      }

      print("User signed up: ${response.message}");
    } catch (e) {
      EasyLoading.dismiss();

      print("Sign-up failed: $e");
    }
  }
}
