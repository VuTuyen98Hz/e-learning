import 'package:learn_japanese/models/word_model.dart';

import 'word_data.dart';

class LessonModel {
  List<WordModel> lesson;

  LessonModel({this.lesson = const []});
}

class LessonStatus {
  bool isAllChecked;
  List<bool> listWordStatus;

  LessonStatus({this.isAllChecked = false, this.listWordStatus=const []});

  factory LessonStatus.fromMap(Map<String, dynamic> data) {
    return LessonStatus(
      isAllChecked: (data['isAllChecked']as bool),
      listWordStatus: ((data['listWordStatus'] ??[]) as List)
              .map((item) => item as bool)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isAllChecked': isAllChecked,
      'listWordStatus': listWordStatus,
    };
  }
}


final List<LessonModel> listLessonModel = [
  LessonModel(
    lesson: schoolWords,
  ),
  LessonModel(
    lesson: natureLandscapeWords,
  ),
  LessonModel(
    lesson: animalWords,
  ),
  LessonModel(
    lesson: bodyPartWords,
  ),
  LessonModel(
    lesson: jobWords,
  ),
  LessonModel(
    lesson: vehicleWords,
  ),
  LessonModel(
    lesson: fashionWords,
  ),
  LessonModel(
    lesson: foodWords,
  ),
  LessonModel(
    lesson: houseWords,
  ),
  LessonModel(
    lesson: entertainmentVenuesWords,
  )
];
