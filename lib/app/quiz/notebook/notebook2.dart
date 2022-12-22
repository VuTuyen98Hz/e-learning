import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notebook_controller.dart';
import 'selected_word2.dart';

class Notebook2 extends StatelessWidget {
  const Notebook2({super.key});

  @override
  Widget build(BuildContext context) {
    final NotebookController rxTab = Get.put(NotebookController());
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          isScrollable: true,
          controller: rxTab.tabController,
          tabs: rxTab.myTabs,
        ),
      ),
      body: TabBarView(controller: rxTab.tabController, children: <Widget>[
        for (int i = 0; i < 10; i++) SelectedWord2(indexTopic: i)
      ]),
    );
  }
}
