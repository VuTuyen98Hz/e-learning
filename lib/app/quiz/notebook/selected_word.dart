import 'package:flutter/material.dart';
import 'package:learn_japanese/models/models.dart';
import '../../authentication/auth_controller.dart';

class SelectedWord extends StatefulWidget {
  const SelectedWord({this.indexTopic = 0, super.key});

  final int indexTopic;

  @override
  State<SelectedWord> createState() => _SelectedWordState();
}

class _SelectedWordState extends State<SelectedWord> {
  List<bool> listCheckedWord = List.filled(10, false);
  List<WordModel> listWord = [];
  List<int> listFinishedLesson = [];

  @override
  Widget build(BuildContext context) {
    final user = AuthController.to.rxFireStoreUser.value!;
    initSelectedWord(user);
    return listFinishedLesson.contains(widget.indexTopic)
        ? Container(
            padding: const EdgeInsets.fromLTRB(15, 30, 20, 0),
            height: 550,
            child: Wrap(
              children: List.generate(10, (index) {
                return InkWell(
                  onTap: () {
                    manageSelectedWord(user, index);
                  },
                  child: SizedBox(
                    height: 45,
                    child: Row(children: [
                      listCheckedWord[index] == true
                          ? const Icon(Icons.check_circle_rounded,
                              color: Colors.green)
                          : const Icon(
                              Icons.circle_outlined,
                              color: Colors.grey,
                            ),
                      const SizedBox(width: 15),
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
            ))
        : const Center(
            child: Text(
            "Bạn chưa hoàn thành bài học này!",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
          ));
  }

  void initSelectedWord(user) {
    listFinishedLesson = user.listFinishedLesson;
    listWord = listLessonModel[widget.indexTopic].lesson;
    listCheckedWord = user.listLessonStatus[widget.indexTopic].listWordStatus;
  }

  void manageSelectedWord(user, int index) {
    setState(() {
      listCheckedWord[index] = !listCheckedWord[index];
    });
    if (listCheckedWord[index] == true &&
        user.listQuizWord.contains(listWord[index]) == false) {
      user.listQuizWord.add(listWord[index]);
    } else {
      user.listQuizWord
          .removeWhere((word) => word.word == listWord[index].word);
    }
  }
}
