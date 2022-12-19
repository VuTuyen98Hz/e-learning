import 'package:learn_japanese/models/word_model.dart';

import 'word_data.dart';

class LessonModel {
  List<WordModel> lesson;

  LessonModel({this.lesson = const []});
}

class LessonStatus {
  bool isFinishLesson;
  List<bool> listWordStatus;

  LessonStatus({this.isFinishLesson = false, this.listWordStatus=const []});

  factory LessonStatus.fromMap(Map<String, dynamic> data) {
    return LessonStatus(
      isFinishLesson: (data['isFinishLesson']as bool),
      listWordStatus: ((data['listWordStatus'] ??[]) as List)
              .map((item) => item as bool)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isFinishLesson': isFinishLesson,
      'listWordStatus': listWordStatus,
    };
  }
}


final List<LessonModel> listLessonModel = [
  LessonModel(
    lesson: schoolWords,
  ),
  LessonModel(
    lesson: examinationWords,
  ),
  LessonModel(
    lesson: extraActivitiesWords,
  ),
  LessonModel(
    lesson: schoolStationeryWords,
  ),
  LessonModel(
    lesson: schoolSubjectWords,
  ),
  LessonModel(
    lesson: schoolWords,
  ),
  LessonModel(
    lesson: examinationWords,
  ),
  LessonModel(
    lesson: extraActivitiesWords,
  ),
  LessonModel(
    lesson: schoolStationeryWords,
  ),
  LessonModel(
    lesson: schoolSubjectWords,
  )
];
