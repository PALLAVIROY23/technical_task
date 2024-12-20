import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_task/api/api_controller.dart';
import 'package:technical_task/app/modules/LoginScreen/extensions/login_extensions.dart';
import 'package:technical_task/app/modules/LoginScreen/model/login.model.dart';

import '../../../routes/app_pages.dart';

class LoginScreenController extends GetxController {
  final ApiController apiController;
  GetStorage box = GetStorage();
  LoginScreenController({required this.apiController});

  var userType = "".obs;
  var loginModel = LoginApi().obs;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }


  void onLoginTap() {
    if (formKey.currentState!.validate()) {

      if (userType.isEmpty) { // Check if userType is not selected
        EasyLoading.showError("Please select your user type");
        return;
      }
      logInUser(
        email: email.text.toString(),
        password: password.text.toString(), userType: userType.toString(),
      );
    }
  }

  Future<void> logInUser({
    required String email,
    required String password,
    required String userType,
  }) async {

    EasyLoading.show(status: "Logging in...");
    try {
      LoginApi response = await apiController.fetchLogin(
        email: email,
        password: password, userType: userType,
      );


      EasyLoading.dismiss();
      if (response.status == true) {
        await apiController.box.write("token", response.token);
        loginModel.value= response;

        Get.offNamed(Routes.HOME);
        EasyLoading.showSuccess("Login Successful");
      } else {
        // Show error message from response
        EasyLoading.dismiss();
        EasyLoading.showError(response.message ?? "Login failed");
      }
    }catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("select valid type or enter valid id password");
      print("Login failed: ${e}");
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    /*email.dispose();
    password.dispose();*/
    super.onClose();
  }

  void increment() => count.value++;
}
