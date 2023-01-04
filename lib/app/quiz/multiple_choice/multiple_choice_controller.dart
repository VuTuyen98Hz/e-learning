import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/models/lesson_model.dart';
import 'package:learn_japanese/models/word_model.dart';
import '../../../helpers/random_index.dart';

class MultipleChoiceController extends GetxController {
  RxBool rxChangeButton = RxBool(false);
  RxBool rxAnswerColor = RxBool(true);
  RxInt rxRightOption = RxInt(0);
  RxInt rxCurrentOption = RxInt(0);
  List<String> listValueOption = [];
  final audioPlayer = AudioPlayer();

  void initListValueOption(WordModel quizWord) {
    List<WordModel> listOption1 = [
      ...listLessonModel[randomIndex(min: 0, max: listLessonModel.length)]
          .lesson
    ];
    List<WordModel> listOption2 = [
      ...listLessonModel[randomIndex(min: 0, max: listLessonModel.length)]
          .lesson
    ];

    int index1 = randomIndex(min: 0, max: listOption1.length);
    String option1 = listOption1[index1].vietnameseMeaning;

    // prevent options with the same value and the same topic
    listOption1.removeWhere((word) =>
        word.vietnameseMeaning == option1 || word.word == quizWord.word);
    listOption2.removeWhere((word) =>
        word.vietnameseMeaning == option1 || word.word == quizWord.word);

    int index2 = randomIndex(min: 0, max: listOption2.length);
    String option2 = listOption2[index2].vietnameseMeaning;

    listValueOption = [option1, option2];
    listValueOption.add(quizWord.vietnameseMeaning);
    listValueOption.shuffle();
  }

  void checkResult(WordModel quizWord) {
    if (rxCurrentOption.value != rxRightOption.value) {
      rxAnswerColor.value = false;
      audioPlayer.play(AssetSource('audio/sound_effect/wrong_answer.mp3'));
    } else {
      audioPlayer.play(AssetSource('audio/sound_effect/correct_answer.mp3'));
    }
    rxChangeButton.value = true;
  }
}
