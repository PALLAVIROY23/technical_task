import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/MyTextForm.dart';
import '../../../../common_widgets/color_extension.dart';
import '../../../../common_widgets/validation.dart';
import '../controllers/edit_profile_screen_controller.dart';

class EditProfileScreenView extends GetView<EditProfileScreenController> {
  const EditProfileScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
            color: HexColor.fromHex("#FFFFFF"),
          ),
        ),
        leading: IconButton(
          onPressed: () {Get.back();},
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage: AssetImage('assets/images/Ellipse 89.png'),
                  ),
                  SizedBox(width: 15.w),
                  ElevatedButton(
                    onPressed: () {
                      print('Upload Profile Photo');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black26,
                    ),
                    child: Text(
                      'Upload profile photo',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                        color: HexColor.fromHex("#FFFFFF"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                "First Name",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: HexColor.fromHex("#FFFFFF"),
                ),
              ).paddingOnly(left: 20.w),
              SizedBox(height: 10.h),
              CustomTextField(
                label: "Name",
                controller: controller.firstNameController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                keyboardType: TextInputType.text,
                validator: true,
                validatorFunc: Validation.validateUserName(),
                onChanged: (String value) {},
              ),
              SizedBox(height: 16.h),
              Text(
                "Last Name",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: HexColor.fromHex("#FFFFFF"),
                ),
              ).paddingOnly(left: 20.w,),
              SizedBox(height: 10.h),
              CustomTextField(
                label: "Last Name",
                controller: controller.lastNameController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                keyboardType: TextInputType.text,
                validator: true,
                validatorFunc: Validation.validateUserName(),
                onChanged: (String value) {},
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                        () => Row(
                      children: [
                        Radio<String>(
                          value: "Male",
                          groupValue: controller.userType.value,
                          onChanged: (value) {
                            controller.userType.value = value!;
                          },
                          activeColor: HexColor.fromHex("#BC30AA"),
                        ),
                        Text(
                          "Male",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                        () => Row(
                      children: [
                        Radio<String>(
                          value: "Female",
                          groupValue: controller.userType.value,
                          onChanged: (value) {
                            controller.userType.value = value!;
                          },
                          activeColor: HexColor.fromHex("#BC30AA"),
                        ),
                        Text(
                          "Female",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              SizedBox(height: 10.h),
              CustomTextField(
                label: "State",
                controller: controller.lastNameController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                keyboardType: TextInputType.text,
                validator: true,
                validatorFunc: Validation.validateUserName(),
                onChanged: (String value) {},
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                label: "State",
                controller: controller.lastNameController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                keyboardType: TextInputType.text,
                validator: true,
                validatorFunc: Validation.validateUserName(),
                onChanged: (String value) {},
              ),
              SizedBox(height: 90.h),
              Center(
                child: ElevatedButton(
                  onPressed: controller.updateProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor.fromHex("#BC30AA"),
                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 80.w),
                  ),
                  child: Text(
                    'UPDATE',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
