import 'package:get/get.dart';

class MultipleChoiceController extends GetxController{
  RxBool rxChangeButton = RxBool(false);
  RxBool rxAnswerColor = RxBool(true);
  RxInt rxRightOption = RxInt(1);
  RxInt currentOption = RxInt(0);


}