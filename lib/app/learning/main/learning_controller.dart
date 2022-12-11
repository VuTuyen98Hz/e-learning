import 'package:get/get.dart';

class LearningController extends GetxController {
  static LearningController to = Get.find();
  RxBool rxIsEndRoundOne = RxBool(false);
  RxList<int> rxListWordRoundTwo = RxList();
  RxInt rxProgressBarPoint = RxInt(0);
  RxList<int> rxListLearnedTopic = RxList();

  void checkResultRoundOne(bool listenResult, bool hintResult, int index) {
    if (listenResult == true && hintResult == true) {
      rxProgressBarPoint += 1;
    } else {
      rxListWordRoundTwo.add(index);
    }
  }

  void checkResulRoundTwo(bool result, int index) {
    if (result) {
      rxProgressBarPoint += 1;
      rxListWordRoundTwo.removeWhere((element) => element == index);
    }
  }

  bool didLearnTopic(int indexTopic) {
    if (rxListLearnedTopic.isEmpty) {
      return false;
    }
    for (int i in rxListLearnedTopic) {
      if (i == indexTopic) {
        return true;
      }
    }
    return false;
  }

  void skipFlashCard(){
    rxProgressBarPoint += 1;
  }

  void resetLearning() {
    rxIsEndRoundOne = RxBool(false);
    rxListWordRoundTwo = RxList();
    rxProgressBarPoint = RxInt(0);
  }
}
