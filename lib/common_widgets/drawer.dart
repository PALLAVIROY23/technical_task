import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_task/app/data/constants.dart';

import '../app/routes/app_pages.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.pink],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/images/profile.png")
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Guest",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Drawer Items
            DrawerItem(
              icon: Icons.person,
              title: 'Profile',
              onTap: () {
                Get.toNamed(Routes.PROFILE_SCREEN);
              },
            ),
            DrawerItem(
              icon: Icons.bar_chart,
              title: 'My Stats',
              onTap: () {},
            ),
            DrawerItem(
              icon: Icons.account_balance_wallet,
              title: 'My Wallet',
              onTap: () {},
            ),
            DrawerItem(
              icon: Icons.update,
              title: 'Update KYC',
              onTap: () {},
            ),
            DrawerItem(
              icon: Icons.leaderboard,
              title: 'Leaderboard',
              onTap: () {},
            ),
            DrawerItem(
              icon: Icons.group,
              title: 'My Referrals',
              onTap: () {},
            ),
            DrawerItem(
              icon: Icons.school,
              title: 'Tutorial',
              onTap: () {},
            ),
            DrawerItem(
              icon: Icons.info,
              title: 'About',
              onTap: () {},
            ),
            DrawerItem(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () async {
                GetStorage box = GetStorage();
                await box.remove(Constant.TOKEN);
                Get.offAllNamed(Routes.LOGIN_SCREEN);
              },            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerItem({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }
}



