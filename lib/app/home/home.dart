import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/quiz/main/quiz_screen.dart';
import '../learning/main/learning_screen.dart';

import 'home_controller.dart';

class HomeUI extends GetView<HomeController> {
  const HomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.rxTabIndex.value,
            children: const [
              LearningScreen(),
              QuizScreen(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blueAccent,
          onTap: controller.changeTabIndex,
          currentIndex: controller.rxTabIndex.value,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          items: [
            _bottomNavigationBarItem(
              iconSource: "assets/icons/read.png",
              label: 'Học tập',
            ),
            _bottomNavigationBarItem(
              iconSource: "assets/icons/quiz.png",
              label: 'Ôn tập',
            ),
          ],
        ),
      ),
    );
  }

  _bottomNavigationBarItem(
      {required String iconSource, required String label}) {
    return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(iconSource),size: 30.0),
      label: label,
    );
  }
}
