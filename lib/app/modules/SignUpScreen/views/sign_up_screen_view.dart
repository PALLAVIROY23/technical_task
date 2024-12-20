import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:technical_task/app/routes/app_pages.dart';
import 'package:technical_task/common_widgets/validation.dart';
import '../../../../common_widgets/CustomTextfield.dart';
import '../../../../common_widgets/MyTextForm.dart';
import '../../../../common_widgets/color_extension.dart';
import '../../VerifyOtpScreen/views/verify_otp_screen_view.dart';
import '../controllers/sign_up_screen_controller.dart';

class SignUpScreenView extends GetView<SignUpScreenController> {
  const SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.withOpacity(0.8), // 80% opacity
              Colors.black // 60% opacity
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Icon
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: HexColor.fromHex("#7064F2"),
                    ),
                    SizedBox(height: 20.h),

                    // Heading
                    Text(
                      "Create an Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // Name TextField
                    CustomTextField(
                      label: "Name",
                      controller: controller.name,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(30),
                      ],
                      keyboardType: TextInputType.text,
                      validator: true,
                      validatorFunc: Validation.validateUserName(),
                      prefix: const Icon(Icons.person, color: Colors.white),
                      onChanged: (String value) {},
                    ),
                    SizedBox(height: 20.h),

                    // Mobile Number TextField
                    CustomTextField(
                      label: "Mobile Number",
                      controller: controller.mobileNumber,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      keyboardType: TextInputType.number,
                      validator: true,
                      validatorFunc: Validation.phoneValidator(),
                      prefix: const Icon(Icons.phone, color: Colors.white),
                      onChanged: (String value) {},
                    ),
                    SizedBox(height: 20.h),

                    // Email TextField
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
                      onChanged: (String value) {},
                    ),
                    SizedBox(height: 20.h),

                    // Password TextField
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
                      onChanged: (String value) {},
                    ),
                    SizedBox(height: 20.h),

                    // Terms and Conditions
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                              () => Checkbox(
                            value: controller.isTermsAccepted.value,
                            onChanged: controller.areCheckboxesEnabled.value
                                ? (value) =>
                            controller.isTermsAccepted.value =
                                value ?? false
                                : null,
                          ),
                        ),
                        Text(
                          "I agree",
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: HexColor.fromHex("#FFFFFF"),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Privacy Policy Term & Condition',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: HexColor.fromHex("#4811FF"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                              () => Checkbox(
                            value: controller.isAgeConfirmed.value,
                            onChanged: controller.areCheckboxesEnabled.value
                                ? (value) =>
                            controller.isAgeConfirmed.value =
                                value ?? false
                                : null,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "I’m over 10 and I understand that under-age uses of this app",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: HexColor.fromHex("#FFFFFF"),
                            ),
                          ),
                        ),
                      ],
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

                    // Submit Button
                    myButton(
                      onTap: controller.validateAndSubmit,
                      text: "Sign In",
                      textcolor: Colors.white,
                      Color: HexColor.fromHex("#BC30AA").withOpacity(0.7),
                      width: double.infinity,
                      height: 50.h,
                    ),
                    SizedBox(height: 20.sp),

                    // Footer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "You have an account? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.LOGIN_SCREEN);
                          },
                          child: const Text(
                            "Login Now",
                            style: TextStyle(
                              color: Colors.purpleAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ).paddingSymmetric(vertical: 55.h, horizontal: 24.w),
              ),
            ),
          ),
        ),
      ),


      bottomSheet: Container(
        color: Colors.black,
        padding: EdgeInsets.all(8.0),
        child: Text(
          "This game may be habit forming or financially risky. Play Responsibly.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
