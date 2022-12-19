import 'package:get/get.dart';
import 'package:learn_japanese/app/authentication/auth_controller.dart';

import '../../../models/word_model.dart';

class LearningController extends GetxController {
  static LearningController to = Get.find();
  RxBool rxIsEndRoundOne = RxBool(false);
  RxList<WordModel> rxListWord = RxList<WordModel>();
  RxList<int> rxListWordRoundTwo = RxList();
  RxInt rxProgressBarPoint = RxInt(0);

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

  bool didFinishedLesson(int indexTopic) {
    final fireStoreUser = AuthController.to.rxFireStoreUser.value!;
      if (fireStoreUser.listFinishedLesson.contains(indexTopic)) {
        return true;
      }
      else{
        return false;
      }
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
