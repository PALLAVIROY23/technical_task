import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:technical_task/app/routes/app_pages.dart';
import 'package:technical_task/common_widgets/validation.dart';
import '../../../../common_widgets/MyTextForm.dart';
import '../../../../common_widgets/color_extension.dart';
import '../../VerifyOtpScreen/views/verify_otp_screen_view.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepPurple.withOpacity(0.8), // 80% opacity
              Colors.black // 60% opacity
            ], begin: Alignment.topCenter),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),

                            SizedBox(height: 20.h),
                            CustomTextField(
                              label: "Email",
                              controller: controller.email,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30),
                              ],
                              keyboardType: TextInputType.emailAddress,
                              validator: true,
                              validatorFunc: Validation.emailValidator(),
                              prefix: const Icon(Icons.email, color: Colors.white),
                              onChanged: (String) {},
                            ),
                            SizedBox(height: 20.h),
                            CustomTextField(
                              label: "Password",
                              controller: controller.password,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(16),
                              ],
                              keyboardType: TextInputType.text,
                              validator: true,
                              validatorFunc: Validation.passwordValidator(),
                              validatorLabel: "Password",
                              prefix: const Icon(Icons.password, color: Colors.white),
                              onChanged: (String) {},
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Obx(
                                  () => Row(
                                    children: [
                                      Radio<String>(
                                        value: "Vendor",
                                        groupValue: controller.userType.value,
                                        onChanged: (value) {
                                          controller.userType.value = value!;
                                        },
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Vendor",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Obx(
                                  () => Row(
                                    children: [
                                      Radio<String>(
                                        value: "User",
                                        groupValue: controller.userType.value,
                                        onChanged: (value) {
                                          controller.userType.value = value!;
                                        },
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "User",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 20.h),
                            myButton(
                                onTap: controller.onLoginTap,
                                text: "Log In",
                                textcolor: Colors.white,
                                Color: HexColor.fromHex("#BC30AA").withOpacity(0.7),
                                width: double.infinity,
                                height: 50.h),
                            SizedBox(height: 20.sp),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "New User? ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.SIGN_UP_SCREEN);
                                  },
                                  child: const Text(
                                    "Create an account",
                                    style: TextStyle(
                                        color: Colors.purpleAccent, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 150.h),
                            const Image(image: AssetImage("assets/images/headset.png")),
                            SizedBox(
                              height: 5.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Support Action
                              },
                              child: Text(
                                "Need Support",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 16.sp,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ).paddingSymmetric(vertical: 65.h),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

    );
  }
}
