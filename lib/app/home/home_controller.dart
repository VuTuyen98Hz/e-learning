import 'package:get/get.dart';

class HomeController extends GetxController {
  var tabIndex = 0;
  // HomeController to = Get.find();
  RxInt rxTabIndex = RxInt(0);

  changeTabIndex2(int index) {
    rxTabIndex.value = index;
  }

  changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
