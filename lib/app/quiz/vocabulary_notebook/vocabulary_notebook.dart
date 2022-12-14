import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_screen/select_word/selected_word.dart';
import '../../home/home.dart';
import 'vocabulary_notebook_controller.dart';
import '../../../models/topics_model.dart';

class VocabularyNotebook extends GetView<VocabularyNotebookController> {
  const VocabularyNotebook({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: listTopics.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              iconSize: 8,
              icon: Image.asset("assets/icons/exit_icon.png"),
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.lightBlue),
                          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("Bạn có muốn lưu lại chỉnh sửa không?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)),
                              ElevatedButton(
                                onPressed: () {
                                  controller.manageSaveEditWord(true);
                                  Get.offAll(const HomeUI(),
                                      transition: Transition.fade);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    fixedSize: const Size(180, 45),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                child: const Text('LƯU LẠI',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  controller.manageSaveEditWord(true);
                                  Get.offAll(const HomeUI(),
                                      transition: Transition.fade);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    fixedSize: const Size(180, 45),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                child: const Text('KHÔNG LƯU',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    fixedSize: const Size(180, 45),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                child: const Text('TIẾP TỤC SỬA',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                              ),
                            ],
                          ))))),
          centerTitle: true,
          title: const Text('Sổ tay từ vựng'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: "Bài 1"),
              Tab(text: "Bài 2"),
              Tab(text: "Bài 3"),
              Tab(text: "Bài 4"),
              Tab(text: "Bài 5"),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            SelectedWord(indexTopic: 0),
            SelectedWord(indexTopic: 1),
            SelectedWord(indexTopic: 2),
            SelectedWord(indexTopic: 3),
            SelectedWord(indexTopic: 4),
          ],
        ),
      ),
    );
  }
}
