import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/quiz/main/quiz_screen.dart';
import '../authentication/profile_screen.dart';
import '../learning/topics/topics_screen.dart';
import 'home_controller.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                TopicsScreen(),
                QuizScreen(),
                ProfileScreen(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.redAccent,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.book,
                label: 'Topics',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.table,
                label: 'Quiz',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.person,
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
