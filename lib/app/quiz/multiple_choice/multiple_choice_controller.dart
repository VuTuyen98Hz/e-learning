import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/models/word_model.dart';
import '../../../helpers/random_index.dart';
import '../../../models/word_data.dart';
import '../main/quiz_controller.dart';

class MultipleChoiceController extends GetxController {
  RxBool rxChangeButton = RxBool(false);
  RxBool rxAnswerColor = RxBool(true);
  RxInt rxRightOption = RxInt(0);
  RxInt rxCurrentOption = RxInt(0);
  List<String> listValueOption =[];
  final audioPlayer = AudioPlayer();


  @override
  void onInit() {
    super.onInit();
    audioPlayer.onPlayerStateChanged.listen((state) {
      state == PlayerState.playing;
    });
  }

  void initListValueOption(WordModel quizWord){
    // Note: tạo thêm một list nữa lưu các từ không có trong model
    listValueOption = [
      schoolWords[randomIndex(min:0, max:schoolWords.length)]
          .vietnameseMeaning,
      schoolWords[randomIndex(min:0, max:schoolWords.length)]
          .vietnameseMeaning
    ];
    listValueOption.add(quizWord.vietnameseMeaning);
    listValueOption.shuffle();
  }

  void checkResult(WordModel quizWord) {
    if (rxCurrentOption.value != rxRightOption.value) {
      rxAnswerColor.value = false;
      audioPlayer.play(AssetSource('audio/sound_effect/wrong_answer.mp3'));
      }else{
      audioPlayer.play(AssetSource('audio/sound_effect/correct_answer.mp3'));
    }
    rxChangeButton.value = true;
  }



}
