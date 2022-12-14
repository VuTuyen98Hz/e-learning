//User Model
class UserModel {
  List<int> listLearnedLesson;
  final String uid;
  final String email;
  final String name;
  final String photoUrl;

  UserModel(
      {this.uid = '',
      this.email = '',
      this.name = '',
      this.photoUrl = '',
      this.listLearnedLesson = const []});

  factory UserModel.fromMap(Map? data) {
    return UserModel(
      uid: data?['uid'],
      email: data?['email'],
      name: data?['name'],
      photoUrl: data?['photoUrl'],
      listLearnedLesson: ((data?['listLearnedLesson'] ?? []) as List)
          .map((item) => item as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "photoUrl": photoUrl,
        "listLearnedLesson": listLearnedLesson
      };
}
