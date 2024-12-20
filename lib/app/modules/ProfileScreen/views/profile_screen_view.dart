import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:technical_task/app/modules/home/views/home_view.dart';
import 'package:technical_task/app/routes/app_pages.dart';
import 'package:technical_task/common_widgets/color_extension.dart';

import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  const ProfileScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'My Profile',
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600, color: HexColor.fromHex("#FFFFFF")),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        actions: [
          Container(
            height: 34.h,
            width: 34.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: HexColor.fromHex("#FFFFFF"), width: 1),
              color: HexColor.fromHex("#FFFFFF"),
            ),
            child: IconButton(
              icon: const Icon(Icons.edit, color: Colors.pink),
              onPressed: () {
                Get.toNamed(Routes.EDIT_PROFILE_SCREEN);
              },
            ),
          ).paddingSymmetric(horizontal: 20.w),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.r, // Using ScreenUtil for responsive radius
                  backgroundImage: const AssetImage('assets/images/Ellipse 89.png'),
                ),
                SizedBox(width: 15.w), // Responsive width
                Column(
                  children: [
                    Obx(() => Text(
                      controller.name.value,
                      style: TextStyle(
                        fontSize: 20.sp, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
                    Obx(() => Text(
                      'Username: ${controller.username.value}',
                      style: TextStyle(
                        fontSize: 14.sp, // Responsive font size
                        color: Colors.white70,
                      ),
                    )),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16.w), // Responsive margin
              child: Padding(
                padding: EdgeInsets.all(16.w), // Responsive padding
                child: Column(
                  children: [
                    buildInfoRow(
                      'Mobile Number',
                      controller.mobileNumber.value,
                      controller.isMobileVerified.value,
                    ),
                    const Divider(),
                    buildInfoRow(
                      'Email Address',
                      controller.emailAddress.value,
                      controller.isEmailVerified.value,
                    ),
                    const Divider(),
                    buildAadhaarRow(context),
                    const Divider(),
                    buildReferralRow(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String title, String value, bool isVerified) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4.h), // Responsive height
            Text(value),
          ],
        ),
        Text(
          isVerified ? 'Verified' : 'Unverified',
          style: TextStyle(color: isVerified ? Colors.green : Colors.red),
        ),
      ],
    );
  }

  Widget buildAadhaarRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Aadhaar', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4.h), // Responsive height
            Obx(() => Text(controller.aadhaarMasked.value)),
          ],
        ),
        TextButton(
          onPressed: () {
            // Open dialog to update Aadhaar
            showDialog(
              context: context,
              builder: (context) {
                String newAadhaar = '';
                return AlertDialog(
                  title: const Text('Update Aadhaar'),
                  content: TextField(
                    onChanged: (value) {
                      newAadhaar = value;
                    },
                    decoration: const InputDecoration(hintText: 'Enter Aadhaar'),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        controller.updateAadhaar(newAadhaar);
                        Navigator.pop(context);
                      },
                      child: const Text('Update'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Update'),
        ),
      ],
    );
  }

  Widget buildReferralRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Referral Code', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4.h), // Responsive height
            Obx(() => Text(controller.referralCode.value)),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {
            controller.shareReferralCode();
          },
        ),
      ],
    );
  }
}
