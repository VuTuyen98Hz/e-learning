import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotebookController extends GetxController with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    for (int i = 0; i < 10; i++) Tab(text: "Bài ${i + 1}"),
  ];

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}