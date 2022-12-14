import 'package:get/get.dart';
import '../../../../models/word_model.dart';

class SelectedController extends GetxController {
  RxList<bool> rxListCheckedWord = RxList.filled(10, false, growable: true);
  RxList<WordModel> rxListWord = RxList<WordModel>();

  void selectWord(int index){
    rxListCheckedWord[index] = !rxListCheckedWord[index];
  }


}
