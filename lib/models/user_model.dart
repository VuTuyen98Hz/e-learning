import 'models.dart';

class UserModel {
  List<int> listFinishedLesson;
  List<double> listValueBarChart;
  List<String> listTopTitleBarChart;
  List<LessonStatus> listLessonStatus;
  List<WordModel> listQuizWord;
  final String uid;
  final String email;
  final String name;
  final String photoUrl;

  UserModel(
      {this.uid = '',
      this.email = '',
      this.name = '',
      this.photoUrl = '',
      this.listLessonStatus = const [],
      this.listFinishedLesson = const [],
      this.listQuizWord = const [],
      this.listValueBarChart = const [],
      this.listTopTitleBarChart = const []});

  factory UserModel.fromMap(Map? data) {
    return UserModel(
        uid: data?['uid'] ?? '',
        email: data?['email'] ?? '',
        name: data?['name'] ?? '',
        photoUrl: data?['photoUrl'] ?? '',
        listFinishedLesson: ((data?['listFinishedLesson'] ?? []) as List)
            .map((item) => item as int)
            .toList(),
        listLessonStatus: ((data?['listLessonStatus'] ?? []) as List)
            .map((data) => LessonStatus.fromMap(data))
            .toList(),
        listQuizWord: ((data?['listQuizWord'] ?? []) as List)
            .map((data) => WordModel.fromMap(data))
            .toList(),
        listValueBarChart: ((data?['listValueBarChart'] ?? []) as List)
            .map((item) => item as double)
            .toList(),
        listTopTitleBarChart: ((data?['listTopTitleBarChart'] ?? []) as List)
            .map((item) => item as String)
            .toList());
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "photoUrl": photoUrl,
        "listFinishedLesson": listFinishedLesson,
        "listLessonStatus":
            listLessonStatus.map((data) => data.toJson()).toList(),
        "listQuizWord": listQuizWord.map((data) => data.toJson()).toList(),
        "listTopTitleBarChart": listTopTitleBarChart,
        "listValueBarChart": listValueBarChart,
      };
}
