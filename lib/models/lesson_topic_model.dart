class LessonTopicModel {
  String descriptions = "";
  String imageAssets = "";
  String meaning = "";

  LessonTopicModel(this.descriptions, this.imageAssets, this.meaning);
}

List<LessonTopicModel> listLessonTopics = [
  LessonTopicModel(
      '1. School', 'assets/images/topics/school.jpg', '1. Trường học'),
  LessonTopicModel('2. Nature Landscape',
      'assets/images/topics/nature_landscape.jpg', '2. Phong cảnh thiên nhiên'),
  LessonTopicModel(
      '3. Animal', 'assets/images/topics/animal.jpg', '3. Động vật'),
  LessonTopicModel('4. Body parts', 'assets/images/topics/body_part.jpg',
      '4. Bộ phận trên cơ thể'),
  LessonTopicModel('5. Job', 'assets/images/topics/job.jpg', '5. Nghề nghiệp'),
  LessonTopicModel('6. Vehicles', 'assets/images/topics/vehicals.png',
      '6. Phương tiện giao thông'),
  LessonTopicModel(
      '7. Fashion', 'assets/images/topics/fashion.png', '7. Thời trang'),
  LessonTopicModel('8. Food', 'assets/images/topics/food.jpg', '8. Đồ ăn'),
  LessonTopicModel('9. Rooms in the house',
      'assets/images/topics/room_in_house.jpg', '9. Các phòng trong nhà'),
  LessonTopicModel('10. Entertainment Venues',
      'assets/images/topics/entertainment_venues.jpg', '10. Địa điểm giải trí'),
];
