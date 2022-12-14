import 'package:flutter/material.dart';
import 'package:learn_japanese/app/quiz/vocabulary_notebook/vocabulary_notebook_controller.dart';

import '../../../models/word_model.dart';

class SelectedWord extends StatefulWidget {
  const SelectedWord({this.indexTopic = 0, super.key});

  final int indexTopic;

  @override
  State<SelectedWord> createState() => _SelectedWordState();
}

class _SelectedWordState extends State<SelectedWord> {
  List<bool> listCheckedWord = List.filled(10, false,growable: true);

  ////////////////////////
  VocabularyNotebookController notebookController =
      VocabularyNotebookController.to;
  List<WordModel> listWord = [];


  @override
  Widget build(BuildContext context) {
    listWord = listLesson[widget.indexTopic].listWord;
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 30, 20, 0),
      height: 550,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                manageSelectedWord(index);
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
                        manageSelectedWord(index);
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
    );
  }

  void manageSelectedWord(int index) {
    setState(() {
      listCheckedWord[index] = !listCheckedWord[index];
    });
  }

// void manageSelectedWord(int index) {
//   setState(() {
//     listWord[index].isSelected = !listWord[index].isSelected;
//   });
//   if(listWord[index].isSelected==true){
//     notebookController.rxListAfterEditWord.add(listWord[index]);
//   }else{
//     notebookController.rxListAfterEditWord.removeWhere((item) => item.word == listWord[index].word);
//   }
// }
}
