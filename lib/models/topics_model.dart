class TopicsModel {
  String descriptions = "";
  String imageUrl = "";
  String meaning = "";

  TopicsModel(this.descriptions, this.imageUrl, this.meaning);
}

List<TopicsModel> listTopics = [
  TopicsModel(
      '1. School',
      'https://img.freepik.com/free-vector/large-school-building-scene_1308-32058.jpg?w=900&t=st=1669344251~exp=1669344851~hmac=60dbeb82d21318991729d60620db746726bbad22badb0d04afd26e4aa85e3de9',
      '1. Trường học'),
  TopicsModel(
      '2. Examination',
      'https://img.freepik.com/free-vector/realistic-test-paper-composition-with-pencil-stack-students-paperwork-with-marks-correct-answers_1284-54249.jpg?w=740&t=st=1669344331~exp=1669344931~hmac=7879f0d3d222d3601e8879df12ce90ab02197ac0c1baab4ab2b465baf41107f5',
      '2. Kỳ thi'),
  TopicsModel(
      '3. Extracurricular Activities',
      'https://img.freepik.com/free-vector/after-school-activities-abstract-concept-illustration_335657-4566.jpg?w=740&t=st=1669344372~exp=1669344972~hmac=e924f68b8e384171f1d2f73618c8c1951499bf286cf37314949cb27e22fe6a6e',
      '3. Hoạt động ngoại khóa'),
  TopicsModel(
      '4. School Stationery',
      'https://img.freepik.com/premium-photo/pile-copybooks-stationery-isolated-white_185193-8960.jpg?w=740',
      '4. Dụng cụ học tập'),
  TopicsModel(
      '5. School Subject',
      'https://img.freepik.com/free-vector/colorful-background-creative-science_1284-1076.jpg?w=740&t=st=1670289791~exp=1670290391~hmac=83561fa0e91af65a41fc4cb5594e4cd6a84b70f8e4744872e99b684396bcc639',
      '5. Các môn học'),
];
