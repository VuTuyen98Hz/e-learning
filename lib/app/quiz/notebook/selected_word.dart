import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/lesson_model.dart';
import '../../../models/word_model.dart';
import '../../authentication/auth_controller.dart';

class SelectedWord extends StatefulWidget {
  const SelectedWord({this.indexTopic = 0, super.key});

  final int indexTopic;

  @override
  State<SelectedWord> createState() => _SelectedWordState();
}

class _SelectedWordState extends State<SelectedWord> {
  late List<bool> listCheckedWord;
  late List<WordModel> listWord;
  late List<int> listFinishedLesson;

  @override
  void initState() {
    super.initState();
    final fsUser = AuthController.to.rxFireStoreUser.value!;
    List<LessonStatus> listLessonStatus = fsUser.listLessonStatus;
    listFinishedLesson = fsUser.listFinishedLesson;
    listWord = listLessonModel[widget.indexTopic].lesson;
    listCheckedWord = listLessonStatus[widget.indexTopic].listWordStatus;
  }

  @override
  Widget build(BuildContext context) {

    // return listLessonStatus[widget.indexTopic].isFinishLesson == true
    return listFinishedLesson.contains(widget.indexTopic)
        ? Container(
            padding: const EdgeInsets.fromLTRB(15, 30, 20, 0),
            height: 550,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        manageSelectedWord(index);
                      });
                    },
                    child: SizedBox(
                      height: 45,
                      child: Row(children: [
                        Checkbox(
                            value: listCheckedWord[index],
                            checkColor: Colors.white,
                            activeColor: Colors.green,
                            shape: const CircleBorder(),
                            onChanged: (_) {
                              setState(() {
                                manageSelectedWord(index);
                              });
                            }),
                        Expanded(
                          child: Text(listWord[index].word,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17)),
                        ),
                        const Expanded(
                          child: Text(' (n)',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17)),
                        ),
                        Expanded(
                          child: Text(listWord[index].vietnameseMeaning,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17)),
                        ),
                      ]),
                    ),
                  );
                }),
          )
        : const Center(
            child: Text(
            "Bạn chưa hoàn thành bài học này!",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
          ));
  }

  void manageSelectedWord(int index) {
    listCheckedWord[index] = !listCheckedWord[index];

    final fsUser = AuthController.to.rxFireStoreUser.value!;
    final list = fsUser.listQuizWord;
    if (listCheckedWord[index] == true &&
        list.contains(listWord[index]) == false) {
      fsUser.listQuizWord.add(listWord[index]);
    } else {
      fsUser.listQuizWord
          .removeWhere((word) => word.word == listWord[index].word);
    }
  }
}
