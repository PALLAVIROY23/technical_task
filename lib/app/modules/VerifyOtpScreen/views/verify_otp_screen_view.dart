import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../common_widgets/color_extension.dart';
import '../controllers/verify_otp_screen_controller.dart';

class VerifyOtpScreenView extends GetView<VerifyOtpScreenController> {
  const VerifyOtpScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.withOpacity(0.8),
              Colors.black
            ],
            begin: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60.sp,
                          backgroundColor: HexColor.fromHex("#7064F2"),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "OTP send",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          " Enter the 6 digit code sent to",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Text(
                          "9895987456",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Obx(() {
                          return PinCodeTextField(
                            cursorColor: Colors.white,
                            textStyle: const TextStyle(color: Colors.white),
                            controller: TextEditingController(text: controller.pin.value),
                            appContext: context,
                            length: 6,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 45.h,
                              fieldWidth: 40.w,
                              inactiveFillColor: Colors.grey[200],
                              activeFillColor: Colors.white,
                              activeColor: Colors.white,
                              selectedColor: Colors.white,
                              inactiveColor: Colors.grey,
                              selectedFillColor: Colors.white,
                            ),
                            onChanged: (value) {
                              controller.updatePin(value);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter OTP';
                              }
                              return null;
                            },
                          );
                        }),
                        SizedBox(height: 20.h),
                        Text(
                          "Haven’t Received OTP?",
                          style: TextStyle(color: HexColor.fromHex("#FFFFFF"), fontSize: 14.sp, fontWeight: FontWeight.w400),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Resend OTP",
                                style: TextStyle(color: HexColor.fromHex("#4811FF"), fontSize: 14.sp, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Text(
                              "OR",
                              style: TextStyle(color: HexColor.fromHex("#FFFFFF"), fontSize: 14.sp, fontWeight: FontWeight.w400),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Change Number",
                                style: TextStyle(color: HexColor.fromHex("#4811FF"), fontSize: 14.sp, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        myButton(
                          onTap: controller.validateAndProceed,
                          text: "Confirm OTP",
                          textcolor: Colors.white,
                          Color: HexColor.fromHex("#BC30AA").withOpacity(0.7),
                          width: double.infinity,
                          height: 50.h,
                        ),
                        Column(
                          children: [
                            const Image(image: AssetImage("assets/images/headset.png")),
                            SizedBox(
                              height: 5.h,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Need Support",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 16.sp,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ).paddingOnly(bottom: 0, top: 150.h),
                      ],
                    ).paddingSymmetric(vertical: 55.h),
                  ),
                ),
                Text(
                  "This game may be habit forming or financially risky. Play Responsibly.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ).paddingOnly(top: 15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget myButton({
  String? text,
  void Function()? onTap,
  Color? Color,
  Color? textcolor,
  double? height,
  double? width,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height ?? Get.height * 0.05,
      width: width ?? Get.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text == null
              ? SizedBox()
              : Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: textcolor,
            ),
          ),
        ],
      ),
    ),
  );
}
