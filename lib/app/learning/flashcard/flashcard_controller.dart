import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import '../../../models/word_model.dart';

class FlashCardController extends GetxController {
  RxBool changeFlashcard = RxBool(false);
  RxBool rxFirstTap = RxBool(false);
  RxList<WordModel> rxListWord = RxList<WordModel>();
  RxInt rxIndex = RxInt(0);
  final audioPlayer = AudioPlayer();


  @override
  void onInit() {
    super.onInit();
    audioPlayer.onPlayerStateChanged.listen((state) {
      state == PlayerState.playing;
    });
    }

  @override
  void onReady() {
    audioPlayer.play(AssetSource(rxListWord[rxIndex.value].audioAsset));
  }
}
