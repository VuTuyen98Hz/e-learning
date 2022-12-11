import 'package:flutter/material.dart';

class ShowAnswer extends StatelessWidget {
  final bool answer;
  bool isVisibleMeaning;
  final String word;
  final String phonetic;
  final String vietnameseMeaning;
  final String example;
  final String translateExample;

  ShowAnswer(
      {Key? key,
      required this.answer,
      required this.isVisibleMeaning,
      required this.word,
      required this.phonetic,
      required this.vietnameseMeaning,
      required this.example,
      required this.translateExample})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.30,
      alignment: Alignment.center,
      color: answer == true ? Colors.green : Colors.red,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 10, 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  word,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 23),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  phonetic,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(vietnameseMeaning,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  example,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: isVisibleMeaning,
                  child: Text(translateExample,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20)),
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
                child: const Icon(
                  Icons.volume_down_alt,
                  color: Colors.yellow,
                  size: 20.0,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  isVisibleMeaning = !isVisibleMeaning;
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
                child: const Icon(
                  Icons.visibility,
                  color: Colors.yellow,
                  size: 20.0,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
