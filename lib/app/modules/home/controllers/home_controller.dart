import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 2.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }


  var tabs = ['All', 'Games', 'Cricket', 'Esports'].obs;
  var selectedTab = 'All'.obs;

  var games = <Map<String, String>>[
    {'name': 'Casino', 'image': 'assets/images/Frame 4.png'},
    {'name': 'Dice Game', 'image': 'assets/images/Frame 6.png'},
    {'name': 'Poker', 'image': 'assets/images/Frame 8.png'},
    {'name': 'Roulette', 'image': 'assets/images/Frame 9.png'},
    {'name': 'Cricket 1', 'image': 'assets/images/Frame 11.png'},
    {'name': 'Cricket 2', 'image': 'assets/images/Frame 9.png'},
  ].obs;

  void selectTab(String tab) {
    selectedTab.value = tab;
    if (tab == 'Cricket') {
      games.value = [
        {'name': 'Cricket 1', 'image': 'assets/images/Frame 11.png'},
        {'name': 'Cricket 2', 'image': 'assets/images/Frame 9.png'},
      ];
    } else {
      games.value = [
        {'name': 'Casino', 'image': 'assets/images/Frame 4.png'},
        {'name': 'Dice Game', 'image': 'assets/images/Frame 6.png'},
        {'name': 'Poker', 'image': 'assets/images/Frame 8.png'},
        {'name': 'Roulette', 'image': 'assets/images/Frame 9.png'},
        {'name': 'Cricket 1', 'image': 'assets/images/Frame 11.png'},
        {'name': 'Cricket 2', 'image': 'assets/images/Frame 9.png'},
      ];
    }
  }

  void playGame(String gameName) {
    Get.snackbar(
      'Play Game',
      'Launching $gameName',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.purple,
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
