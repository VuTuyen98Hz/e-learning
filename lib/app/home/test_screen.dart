import 'package:flutter/material.dart';
import 'package:learn_japanese/models/lesson_model.dart';

import '../../models/word_model.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({this.indexTopic = 0, super.key});

  final int indexTopic;

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<WordModel> listWord = [];
  List<int> listFinishedLesson = [];
  List<LessonStatus> listLessonStatus = [];
  final allChecked = CheckBoxModal();
  final listCheckedBox = [
    CheckBoxModal(word: "Hello 1"),
    CheckBoxModal(word: "Hello 2"),
    CheckBoxModal(word: "Hello 3")
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Test Screen"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            ListTile(
              onTap: () => onAllChecked(allChecked),
              leading: Checkbox(
                activeColor: Colors.green,
                shape: const CircleBorder(),
                value: allChecked.value,
                onChanged: (value) => onAllChecked(allChecked),
              ),
              title: const Text("this is test"),
            ),
            const Divider(),
            ...listCheckedBox.map(
                  (item) => ListTile(
                onTap: () => onChecked(item),
                leading: Checkbox(
                  value: item.value,
                  onChanged: (value) => onChecked(item),
                ),
                title: Text(item.word),
              ),
            )
          ],
        ));
  }

  onAllChecked(CheckBoxModal checkedWord) {
    final newChecked = !checkedWord.value;
    setState(() {
      checkedWord.value = newChecked;
      for (var element in listCheckedBox) {
        element.value = newChecked;
      }
    });
  }

  onChecked(CheckBoxModal checkedWord) {
    final newChecked = !checkedWord.value;
    setState(() {
      checkedWord.value = newChecked;
      if (!newChecked) {
        allChecked.value = false;
      } else {
        final allListChecked = listCheckedBox.every((element) => element.value);
        allChecked.value = allListChecked;
      }
    });
  }
}

class CheckBoxModal {
  bool value;
  String word;

  CheckBoxModal({this.value = false, this.word = ''});
}
