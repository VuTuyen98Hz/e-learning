import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/quiz/main/quiz_screen.dart';
import '../authentication/profile_screen.dart';
import '../learning/topics/topics_screen.dart';
import '../quiz/main/quiz_controller.dart';
import 'home_controller.dart';

class HomeUI extends GetView<HomeController> {
  const HomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(QuizController());
    controller.rxTabIndex.value = Get.arguments;
    return Obx(()=> Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: controller.rxTabIndex.value,
          children: [
            const TopicsScreen(),
            QuizScreen(),
            const ProfileScreen(),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.redAccent,
        onTap: controller.changeTabIndex2,
        currentIndex: controller.rxTabIndex.value,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          _bottomNavigationBarItem(
            icon: Icons.newspaper,
            label: 'Topics',
          ),
          _bottomNavigationBarItem(
            icon: Icons.table_chart,
            label: 'Quiz',
          ),
          _bottomNavigationBarItem(
            icon: Icons.person,
            label: 'Account',
          ),
        ],
      ),
    ),
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
