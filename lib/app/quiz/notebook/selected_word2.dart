import 'package:flutter/material.dart';
import 'package:learn_japanese/models/models.dart';
import '../../authentication/auth_controller.dart';

class SelectedWord2 extends StatefulWidget {
  const SelectedWord2({this.indexLesson = 0, super.key});

  final int indexLesson;

  @override
  State<SelectedWord2> createState() => _SelectedWord2State();
}

class _SelectedWord2State extends State<SelectedWord2> {
  List<bool> listWordStatus = List.filled(10, false);
  List<WordModel> lesson = [];
  List<int> listFinishedLesson = [];

  @override
  Widget build(BuildContext context) {
    final user = AuthController.to.rxFireStoreUser.value!;
    final lessonStatus = user.listLessonStatus[widget.indexLesson];
    final size = MediaQuery.of(context).size;

    initSelectedWord(user, lessonStatus);
    return listFinishedLesson.contains(widget.indexLesson)
        ? Column(
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(15, 30, 20, 0),
                  height: size.height * 0.60,
                  child: ListView.builder(
                      itemCount: listWordStatus.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            onChecked(user, index, lessonStatus);
                          },
                          child: SizedBox(
                            height: 45,
                            child: Row(children: [
                              listWordStatus[index] == true
                                  ? const Icon(Icons.check_circle_rounded,
                                      color: Colors.green)
                                  : const Icon(
                                      Icons.circle_outlined,
                                      color: Colors.grey,
                                    ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Text(lesson[index].word,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17)),
                              ),
                              const Expanded(
                                child: Text(' (n)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17)),
                              ),
                              Expanded(
                                child: Text(lesson[index].vietnameseMeaning,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17)),
                              ),
                            ]),
                          ),
                        );
                      })),
              ElevatedButton(
                onPressed: () {
                  onAllChecked(user, lessonStatus);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(110, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: lessonStatus.isAllChecked == false
                    ? const Text('Chọn tất cả')
                    : const Text('Bỏ tất cả'),
              ),
            ],
          )
        : const Center(
            child: Text(
            "Bạn chưa hoàn thành bài học này!",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
          ));
  }

  void initSelectedWord(UserModel user, LessonStatus lessonStatus) {
    listFinishedLesson = user.listFinishedLesson;
    lesson = listLessonModel[widget.indexLesson].lesson;
    listWordStatus = lessonStatus.listWordStatus;
  }

  onAllChecked(UserModel user, LessonStatus lessonStatus) {
    setAllCheckedStatus(lessonStatus);
    lessonStatus.isAllChecked = !lessonStatus.isAllChecked;
    setState(() {
      for (int i = 0; i < listWordStatus.length; i++) {
        listWordStatus[i] = lessonStatus.isAllChecked;
      }
    });

    if (lessonStatus.isAllChecked) {
      user.listQuizWord.addAll(lesson);
    } else {
      for (int i = 0; i < lesson.length; i++) {
        user.listQuizWord.removeWhere((word) => word.word == lesson[i].word);
      }
    }
  }

  onChecked(UserModel user, int index, LessonStatus lessonStatus) {
    final newChecked = !listWordStatus[index];
    setState(() {
      listWordStatus[index] = newChecked;
      lessonStatus.isAllChecked = true;
    });
    setAllCheckedStatus(lessonStatus);
    if (listWordStatus[index] == true &&
        user.listQuizWord.contains(lesson[index]) == false) {
      user.listQuizWord.add(lesson[index]);
    } else {
      user.listQuizWord.removeWhere((word) => word.word == lesson[index].word);
    }
  }

  void setAllCheckedStatus(LessonStatus lessonStatus) {
    if (listWordStatus.every((status) => status == false)) {
      lessonStatus.isAllChecked = false;
    } else {
      lessonStatus.isAllChecked = true;
    }
  }
}
