import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:technical_task/common_widgets/color_extension.dart';

import '../../../../common_widgets/drawer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor.fromHex("#F63FDE"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: NavBar(),
      backgroundColor: HexColor.fromHex("#F63FDE"),
      body: Column(
        children: [
          // Banner Section
          const Image(image: AssetImage("assets/images/GameOfTheDay.png")).paddingSymmetric(horizontal: 20.w),
          SizedBox(height: 8.h),
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: controller.tabs.map((tab) {
              final isSelected = controller.selectedTab.value == tab;
              return GestureDetector(
                onTap: () => controller.selectTab(tab),
                child: Text(
                  tab,
                  style: TextStyle(
                    color: isSelected ? Colors.orange : Colors.white,
                    fontSize: 16.sp,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              );
            }).toList(),
          )),
          SizedBox(height: 16.h),
          // Game Cards Section
          Expanded(
            child: Obx(() => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 12.w,
              ),
              itemCount: controller.games.length,
              itemBuilder: (context, index) {
                final game = controller.games[index];
                return GestureDetector(
                  onTap: () => controller.playGame(game['name']!),
                  child: Column(
                    children: [
                      Image.asset(
                        game['image']!,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                );
              },
            )).paddingSymmetric(horizontal: 20.w),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: HexColor.fromHex("#2A2A2A"),
        currentIndex: 2,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.help,), label: 'Help',),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quizzes'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: 'Winners'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
