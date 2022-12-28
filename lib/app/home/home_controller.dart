import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt rxConnectionType = RxInt(0);
  final Connectivity connectivity = Connectivity();
  RxInt rxTabIndex = RxInt(0);
  late StreamSubscription streamSubscription;

  changeTabIndex(int index) {
    rxTabIndex.value = index;
  }

  // var tabIndex = 0;
  // changeTabIndex2(int index) {
  //   tabIndex = index;
  //   update();
  // }

  @override
  void onInit() {
    super.onInit();
    getConnectType();
    streamSubscription = connectivity.onConnectivityChanged.listen(updateState);
  }

  Future<void> getConnectType() async {
    ConnectivityResult connectivityResult = ConnectivityResult.wifi;
    try {
      connectivityResult = await (connectivity.checkConnectivity());
    } on PlatformException catch (error) {
      debugPrint("Hello Connect $error");
    }
    return updateState(connectivityResult);
  }

  updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        rxConnectionType.value = 1;
        break;
      case ConnectivityResult.mobile:
        rxConnectionType.value = 2;
        break;
      case ConnectivityResult.none:
        rxConnectionType.value = 0;
        break;
      default:
        Get.snackbar('Network Error', 'Failed to get network status');
    }
  }

//control network

}
