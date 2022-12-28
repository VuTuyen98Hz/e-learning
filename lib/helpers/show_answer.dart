import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ShowAnswer extends StatefulWidget {
  final bool result;
  bool isVisibleMeaning;
  final String pathAudio;
  final String word;
  final String phonetic;
  final String vietnameseMeaning;
  final String example;
  final String translateExample;

  ShowAnswer(
      {Key? key,
      required this.result,
      required this.isVisibleMeaning,
      required this.word,
      required this.phonetic,
      required this.vietnameseMeaning,
      required this.example,
      required this.translateExample, required this.pathAudio})
      : super(key: key);

  @override
  State<ShowAnswer> createState() => _ShowAnswerState();
}

class _ShowAnswerState extends State<ShowAnswer> {
  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      state == PlayerState.playing;
    });
    if (widget.result == true) {
      audioPlayer.play(AssetSource('audio/sound_effect/correct_answer.mp3'));
    } else {
      audioPlayer.play(AssetSource('audio/sound_effect/wrong_answer.mp3'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.30,
      alignment: Alignment.center,
      color: widget.result == true ? Colors.green : Colors.red,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 10, 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.word,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 23),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.phonetic,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(widget.vietnameseMeaning,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.example,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.5),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: widget.isVisibleMeaning,
                  child: Text(widget.translateExample,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.5)),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    audioPlayer.play(AssetSource(widget.pathAudio));
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(7),
                ),
                child: Container(
                  height: 45.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      alignment: FractionalOffset.topCenter,
                      image: AssetImage("assets/icons/speaking.png"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.isVisibleMeaning = !widget.isVisibleMeaning;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(7),
                ),
                child: Container(
                  height: 45.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      alignment: FractionalOffset.topCenter,
                      image: AssetImage("assets/icons/translation.png"),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
