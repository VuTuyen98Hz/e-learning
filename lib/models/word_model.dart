class WordModel {
  String word;
  String imageUrl;

  String audioUrl;
  String phonetic;
  String vietnameseMeaning;
  String example;
  String translateExample;

  WordModel(
      {this.word = '',
      this.imageUrl = '',
      this.audioUrl = '',
      this.phonetic = '',
      this.vietnameseMeaning = '',
      this.example = '',
      this.translateExample = ''});
}

// final List<List<WordModel>> listTopicWords = [
//   schoolWords,
//   examinationWords,
//   extraActivitiesWords,
//   schoolStationeryWords,
//   schoolSubjectWords,
// ];

final List<WordModel> schoolWords = [
  WordModel(
      word: 'classroom',
      imageUrl:
          'https://www.responsiveclassroom.org/wp-content/uploads/2016/04/DSC_2388-1024x682.jpg',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/classroom-uk.mp3",
      phonetic: "/ˈklæs.ruːm/",
      vietnameseMeaning: "Lớp học",
      example: "I don't think another desk will fit into this classroom.",
      translateExample:
          "Tôi không nghĩ một cái bàn nào khác sẽ vừa với lớp học này"),
  WordModel(
      word: 'blackboard',
      imageUrl:
          'https://img.freepik.com/premium-vector/blank-retro-class-blackboard-with-chalk-pieces-empty-black-chalkboard-vector-illustration-education-concept-blackboard-school-chalkboard-classroom_53562-6058.jpg?w=360',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/blackboard-us.mp3",
      phonetic: "/ˈblæk.bɔːrd/",
      vietnameseMeaning: "Bảng đen",
      example: "Alice rubbed the blackboard clean for the teacher.",
      translateExample: "Alice lau bảng đen cho giáo viên"),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://apicms.thestar.com.my/uploads/images/2022/05/15/1585587.jpg',
      audioUrl: "",
      phonetic: "/ˈtiː.tʃɚ/",
      vietnameseMeaning: "Giáo viên",
      example: "My mother is a teacher at our secondary school",
      translateExample: "Mẹ của tôi là giáo viên trung học"),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://img.freepik.com/free-photo/sports-teacher-gym-class_23-2149070721.jpg?w=740&t=st=1670216343~exp=1670216943~hmac=9ceed6160491580696d152d2ca122dd30b805bf4b719d6fbe5860425bb4dc2bc',
      audioUrl: "",
      phonetic: "/ˌfɪz.ɪ.kəl ed.jʊˈkeɪ.ʃən/",
      vietnameseMeaning: "Giáo viên thể dục",
      example: "My sister is a teacher at the local high school",
      translateExample:
          "Chị gái tôi là giáo viên thể dục tại trường trung học địa phương"),
  WordModel(
      word: 'student',
      imageUrl:
          'https://img.freepik.com/free-photo/happy-young-female-student-holding-notebooks-from-courses-smiling-camera-standing-spring-clothes-against-blue-background_1258-70161.jpg?w=2000',
      audioUrl: "https://api.dictionaryapi.dev/media/pronunciations/en/teacher",
      phonetic: "/ˈstuː.dənt/",
      vietnameseMeaning: "Học sinh, sinh viên",
      example: "His younger sister is a student at Harvard university",
      translateExample:
          "Em gái của anh ấy là sinh viên trường đại học Harvard"),
  WordModel(
      word: 'pencil',
      imageUrl:
          'https://img.freepik.com/premium-photo/wooden-pencil_252085-11296.jpg?w=740',
      audioUrl: "",
      phonetic: "/ˈpen.səl/",
      vietnameseMeaning: "Bút chì",
      example: "a box of coloured pencils",
      translateExample: "Một hộp bút chì màu"),
  WordModel(
      word: 'blackboard',
      imageUrl:
          'https://img.freepik.com/premium-vector/blank-retro-class-blackboard-with-chalk-pieces-empty-black-chalkboard-vector-illustration-education-concept-blackboard-school-chalkboard-classroom_53562-6058.jpg?w=360',
      audioUrl: "",
      phonetic: "/ˈblæk.bɔːrd/",
      vietnameseMeaning: "Bảng đen",
      example: "Alice rubbed the blackboard clean for the teacher.",
      translateExample: "Alice lau bảng đen cho giáo viên"),
  WordModel(
      word: 'computer',
      imageUrl:
          'https://haiphongcomputer.vn/wp-content/uploads/2020/12/oman.jpg',
      audioUrl: "",
      phonetic: "/kəmˈpjuː.t̬ɚ/",
      vietnameseMeaning: "Máy tính để bàn",
      example: "We've put all our records on computer.",
      translateExample: "Chúng tôi đã ghi tất cả số hồ sơ vào máy tính"),
  WordModel(
      word: 'fan',
      imageUrl: 'https://m.media-amazon.com/images/I/71PCDnGz7RL._SL1500_.jpg',
      audioUrl: "",
      phonetic: "/fæn/",
      vietnameseMeaning: "Cái quạt",
      example:
          "There was no air conditioning, just a ceiling fan turning slowly.",
      translateExample:
          "Không có điều hòa, chỉ có một chiếc quạt trần quay chậm."),
  WordModel(
      word: 'window',
      imageUrl:
          'https://www.eboss.co.nz/assets/ProductImages/altherm-window-systems/altherm-smartwood-box-and-bay-windows/Swood-box-and-bay__FitMaxWzEyMDAsMTIwMF0.jpg',
      audioUrl: "",
      phonetic: "/ˈwɪn.doʊ/",
      vietnameseMeaning: "Cửa sổ",
      example: "I was admiring the cathedral's stained-glass windows.",
      translateExample:
          "Tôi đang chiêm ngưỡng những cửa sổ kính màu của nhà thờ."),
];
final List<WordModel> examinationWords = [
  WordModel(
      word: 'computer',
      imageUrl:
          'https://haiphongcomputer.vn/wp-content/uploads/2020/12/oman.jpg',
      audioUrl: "",
      phonetic: "/kəmˈpjuː.t̬ɚ/",
      vietnameseMeaning: "Máy tính để bàn",
      example: "We've put all our records on computer.",
      translateExample: "Chúng tôi đã ghi tất cả số hồ sơ vào máy tính"),
  WordModel(
      word: 'fan',
      imageUrl: 'https://m.media-amazon.com/images/I/71PCDnGz7RL._SL1500_.jpg',
      audioUrl: "",
      phonetic: "/fæn/",
      vietnameseMeaning: "Cái quạt",
      example:
          "There was no air conditioning, just a ceiling fan turning slowly.",
      translateExample:
          "Không có điều hòa, chỉ có một chiếc quạt trần quay chậm."),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://apicms.thestar.com.my/uploads/images/2022/05/15/1585587.jpg',
      audioUrl: "",
      phonetic: "/ˈtiː.tʃɚ/",
      vietnameseMeaning: "Giáo viên",
      example: "My mother is a teacher at our secondary school",
      translateExample: "Mẹ của tôi là giáo viên trung học"),
  WordModel(
      word: 'window',
      imageUrl:
          'https://www.eboss.co.nz/assets/ProductImages/altherm-window-systems/altherm-smartwood-box-and-bay-windows/Swood-box-and-bay__FitMaxWzEyMDAsMTIwMF0.jpg',
      audioUrl: "",
      phonetic: "/ˈwɪn.doʊ/",
      vietnameseMeaning: "Cửa sổ",
      example: "I was admiring the cathedral's stained-glass windows.",
      translateExample:
          "Tôi đang chiêm ngưỡng những cửa sổ kính màu của nhà thờ."),
  WordModel(
      word: 'classroom',
      imageUrl:
          'https://www.responsiveclassroom.org/wp-content/uploads/2016/04/DSC_2388-1024x682.jpg',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/classroom-uk.mp3",
      phonetic: "/ˈklæs.ruːm/",
      vietnameseMeaning: "Lớp học",
      example: "I don't think another desk will fit into this classroom.",
      translateExample:
          "Tôi không nghĩ một cái bàn nào khác sẽ vừa với lớp học này"),
  WordModel(
      word: 'blackboard',
      imageUrl:
          'https://img.freepik.com/premium-vector/blank-retro-class-blackboard-with-chalk-pieces-empty-black-chalkboard-vector-illustration-education-concept-blackboard-school-chalkboard-classroom_53562-6058.jpg?w=360',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/blackboard-us.mp3",
      phonetic: "/ˈblæk.bɔːrd/",
      vietnameseMeaning: "Bảng đen",
      example: "Alice rubbed the blackboard clean for the teacher.",
      translateExample: "Alice lau bảng đen cho giáo viên"),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://img.freepik.com/free-photo/sports-teacher-gym-class_23-2149070721.jpg?w=740&t=st=1670216343~exp=1670216943~hmac=9ceed6160491580696d152d2ca122dd30b805bf4b719d6fbe5860425bb4dc2bc',
      audioUrl: "",
      phonetic: "/ˌfɪz.ɪ.kəl ed.jʊˈkeɪ.ʃən/",
      vietnameseMeaning: "Giáo viên thể dục",
      example: "My sister is a teacher at the local high school",
      translateExample:
          "Chị gái tôi là giáo viên thể dục tại trường trung học địa phương"),
  WordModel(
      word: 'student',
      imageUrl:
          'https://img.freepik.com/free-photo/happy-young-female-student-holding-notebooks-from-courses-smiling-camera-standing-spring-clothes-against-blue-background_1258-70161.jpg?w=2000',
      audioUrl: "https://api.dictionaryapi.dev/media/pronunciations/en/teacher",
      phonetic: "/ˈstuː.dənt/",
      vietnameseMeaning: "Học sinh, sinh viên",
      example: "His younger sister is a student at Harvard university",
      translateExample:
          "Em gái của anh ấy là sinh viên trường đại học Harvard"),
  WordModel(
      word: 'pencil',
      imageUrl:
          'https://img.freepik.com/premium-photo/wooden-pencil_252085-11296.jpg?w=740',
      audioUrl: "",
      phonetic: "/ˈpen.səl/",
      vietnameseMeaning: "Bút chì",
      example: "a box of coloured pencils",
      translateExample: "Một hộp bút chì màu"),
  WordModel(
      word: 'blackboard',
      imageUrl:
          'https://img.freepik.com/premium-vector/blank-retro-class-blackboard-with-chalk-pieces-empty-black-chalkboard-vector-illustration-education-concept-blackboard-school-chalkboard-classroom_53562-6058.jpg?w=360',
      audioUrl: "",
      phonetic: "/ˈblæk.bɔːrd/",
      vietnameseMeaning: "Bảng đen",
      example: "Alice rubbed the blackboard clean for the teacher.",
      translateExample: "Alice lau bảng đen cho giáo viên"),
];
final List<WordModel> extraActivitiesWords = [
  WordModel(
      word: 'student',
      imageUrl:
          'https://img.freepik.com/free-photo/happy-young-female-student-holding-notebooks-from-courses-smiling-camera-standing-spring-clothes-against-blue-background_1258-70161.jpg?w=2000',
      audioUrl: "https://api.dictionaryapi.dev/media/pronunciations/en/teacher",
      phonetic: "/ˈstuː.dənt/",
      vietnameseMeaning: "Học sinh, sinh viên",
      example: "His younger sister is a student at Harvard university",
      translateExample:
          "Em gái của anh ấy là sinh viên trường đại học Harvard"),
  WordModel(
      word: 'computer',
      imageUrl:
          'https://haiphongcomputer.vn/wp-content/uploads/2020/12/oman.jpg',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/computer-uk.mp3",
      phonetic: "/kəmˈpjuː.t̬ɚ/",
      vietnameseMeaning: "Máy tính để bàn",
      example: "We've put all our records on computer.",
      translateExample: "Chúng tôi đã ghi tất cả số hồ sơ vào máy tính"),
  WordModel(
      word: 'fan',
      imageUrl: 'https://m.media-amazon.com/images/I/71PCDnGz7RL._SL1500_.jpg',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/fan-uk.mp3",
      phonetic: "/fæn/",
      vietnameseMeaning: "Cái quạt",
      example:
          "There was no air conditioning, just a ceiling fan turning slowly.",
      translateExample:
          "Không có điều hòa, chỉ có một chiếc quạt trần quay chậm."),
  WordModel(
      word: 'window',
      imageUrl:
          'https://www.eboss.co.nz/assets/ProductImages/altherm-window-systems/altherm-smartwood-box-and-bay-windows/Swood-box-and-bay__FitMaxWzEyMDAsMTIwMF0.jpg',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/window-uk.mp3",
      phonetic: "/ˈwɪn.doʊ/",
      vietnameseMeaning: "Cửa sổ",
      example: "I was admiring the cathedral's stained-glass windows.",
      translateExample:
          "Tôi đang chiêm ngưỡng những cửa sổ kính màu của nhà thờ."),
  WordModel(
      word: 'pencil',
      imageUrl:
          'https://img.freepik.com/premium-photo/wooden-pencil_252085-11296.jpg?w=740',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/pencil-us.mp3",
      phonetic: "/ˈpen.səl/",
      vietnameseMeaning: "Bút chì",
      example: "a box of coloured pencils",
      translateExample: "Một hộp bút chì màu"),
  WordModel(
      word: 'classroom',
      imageUrl:
          'https://www.responsiveclassroom.org/wp-content/uploads/2016/04/DSC_2388-1024x682.jpg',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/classroom-uk.mp3",
      phonetic: "/ˈklæs.ruːm/",
      vietnameseMeaning: "Lớp học",
      example: "I don't think another desk will fit into this classroom.",
      translateExample:
          "Tôi không nghĩ một cái bàn nào khác sẽ vừa với lớp học này"),
  WordModel(
      word: 'blackboard',
      imageUrl:
          'https://img.freepik.com/premium-vector/blank-retro-class-blackboard-with-chalk-pieces-empty-black-chalkboard-vector-illustration-education-concept-blackboard-school-chalkboard-classroom_53562-6058.jpg?w=360',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/blackboard-us.mp3",
      phonetic: "/ˈblæk.bɔːrd/",
      vietnameseMeaning: "Bảng đen",
      example: "Alice rubbed the blackboard clean for the teacher.",
      translateExample: "Alice lau bảng đen cho giáo viên"),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://apicms.thestar.com.my/uploads/images/2022/05/15/1585587.jpg',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/teacher-uk.mp3",
      phonetic: "/ˈtiː.tʃɚ/",
      vietnameseMeaning: "Giáo viên",
      example: "My mother is a teacher at our secondary school",
      translateExample: "Mẹ của tôi là giáo viên trung học"),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://img.freepik.com/free-photo/sports-teacher-gym-class_23-2149070721.jpg?w=740&t=st=1670216343~exp=1670216943~hmac=9ceed6160491580696d152d2ca122dd30b805bf4b719d6fbe5860425bb4dc2bc',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/teacher-uk.mp3",
      phonetic: "/ˌfɪz.ɪ.kəl ed.jʊˈkeɪ.ʃən/",
      vietnameseMeaning: "Giáo viên thể dục",
      example: "My sister is a teacher at the local high school",
      translateExample:
          "Chị gái tôi là giáo viên thể dục tại trường trung học địa phương"),
  WordModel(
      word: 'blackboard',
      imageUrl:
          'https://img.freepik.com/premium-vector/blank-retro-class-blackboard-with-chalk-pieces-empty-black-chalkboard-vector-illustration-education-concept-blackboard-school-chalkboard-classroom_53562-6058.jpg?w=360',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/blackboard-us.mp3",
      phonetic: "/ˈblæk.bɔːrd/",
      vietnameseMeaning: "Bảng đen",
      example: "Alice rubbed the blackboard clean for the teacher.",
      translateExample: "Alice lau bảng đen cho giáo viên"),
];
final List<WordModel> schoolStationeryWords = [
  WordModel(
      word: 'classroom',
      imageUrl:
          'https://www.responsiveclassroom.org/wp-content/uploads/2016/04/DSC_2388-1024x682.jpg',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/classroom-uk.mp3",
      phonetic: "/ˈklæs.ruːm/",
      vietnameseMeaning: "Lớp học",
      example: "I don't think another desk will fit into this classroom.",
      translateExample:
          "Tôi không nghĩ một cái bàn nào khác sẽ vừa với lớp học này"),
  WordModel(
      word: 'blackboard',
      imageUrl:
          'https://img.freepik.com/premium-vector/blank-retro-class-blackboard-with-chalk-pieces-empty-black-chalkboard-vector-illustration-education-concept-blackboard-school-chalkboard-classroom_53562-6058.jpg?w=360',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/blackboard-us.mp3",
      phonetic: "/ˈblæk.bɔːrd/",
      vietnameseMeaning: "Bảng đen",
      example: "Alice rubbed the blackboard clean for the teacher.",
      translateExample: "Alice lau bảng đen cho giáo viên"),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://apicms.thestar.com.my/uploads/images/2022/05/15/1585587.jpg',
      audioUrl: "",
      phonetic: "/ˈtiː.tʃɚ/",
      vietnameseMeaning: "Giáo viên",
      example: "My mother is a teacher at our secondary school",
      translateExample: "Mẹ của tôi là giáo viên trung học"),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://img.freepik.com/free-photo/sports-teacher-gym-class_23-2149070721.jpg?w=740&t=st=1670216343~exp=1670216943~hmac=9ceed6160491580696d152d2ca122dd30b805bf4b719d6fbe5860425bb4dc2bc',
      audioUrl: "",
      phonetic: "/ˌfɪz.ɪ.kəl ed.jʊˈkeɪ.ʃən/",
      vietnameseMeaning: "Giáo viên thể dục",
      example: "My sister is a teacher at the local high school",
      translateExample:
          "Chị gái tôi là giáo viên thể dục tại trường trung học địa phương"),
  WordModel(
      word: 'student',
      imageUrl:
          'https://img.freepik.com/free-photo/happy-young-female-student-holding-notebooks-from-courses-smiling-camera-standing-spring-clothes-against-blue-background_1258-70161.jpg?w=2000',
      audioUrl: "https://api.dictionaryapi.dev/media/pronunciations/en/teacher",
      phonetic: "/ˈstuː.dənt/",
      vietnameseMeaning: "Học sinh, sinh viên",
      example: "His younger sister is a student at Harvard university",
      translateExample:
          "Em gái của anh ấy là sinh viên trường đại học Harvard"),
  WordModel(
      word: 'pencil',
      imageUrl:
          'https://img.freepik.com/premium-photo/wooden-pencil_252085-11296.jpg?w=740',
      audioUrl: "",
      phonetic: "/ˈpen.səl/",
      vietnameseMeaning: "Bút chì",
      example: "a box of coloured pencils",
      translateExample: "Một hộp bút chì màu"),
  WordModel(
      word: 'blackboard',
      imageUrl:
          'https://img.freepik.com/premium-vector/blank-retro-class-blackboard-with-chalk-pieces-empty-black-chalkboard-vector-illustration-education-concept-blackboard-school-chalkboard-classroom_53562-6058.jpg?w=360',
      audioUrl: "",
      phonetic: "/ˈblæk.bɔːrd/",
      vietnameseMeaning: "Bảng đen",
      example: "Alice rubbed the blackboard clean for the teacher.",
      translateExample: "Alice lau bảng đen cho giáo viên"),
  WordModel(
      word: 'computer',
      imageUrl:
          'https://haiphongcomputer.vn/wp-content/uploads/2020/12/oman.jpg',
      audioUrl: "",
      phonetic: "/kəmˈpjuː.t̬ɚ/",
      vietnameseMeaning: "Máy tính để bàn",
      example: "We've put all our records on computer.",
      translateExample: "Chúng tôi đã ghi tất cả số hồ sơ vào máy tính"),
  WordModel(
      word: 'fan',
      imageUrl: 'https://m.media-amazon.com/images/I/71PCDnGz7RL._SL1500_.jpg',
      audioUrl: "",
      phonetic: "/fæn/",
      vietnameseMeaning: "Cái quạt",
      example:
          "There was no air conditioning, just a ceiling fan turning slowly.",
      translateExample:
          "Không có điều hòa, chỉ có một chiếc quạt trần quay chậm."),
  WordModel(
      word: 'window',
      imageUrl:
          'https://www.eboss.co.nz/assets/ProductImages/altherm-window-systems/altherm-smartwood-box-and-bay-windows/Swood-box-and-bay__FitMaxWzEyMDAsMTIwMF0.jpg',
      audioUrl: "",
      phonetic: "/ˈwɪn.doʊ/",
      vietnameseMeaning: "Cửa sổ",
      example: "I was admiring the cathedral's stained-glass windows.",
      translateExample:
          "Tôi đang chiêm ngưỡng những cửa sổ kính màu của nhà thờ."),
];
final List<WordModel> schoolSubjectWords = [
  WordModel(
      word: 'classroom',
      imageUrl:
          'https://www.responsiveclassroom.org/wp-content/uploads/2016/04/DSC_2388-1024x682.jpg',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/classroom-uk.mp3",
      phonetic: "/ˈklæs.ruːm/",
      vietnameseMeaning: "Lớp học",
      example: "I don't think another desk will fit into this classroom.",
      translateExample:
          "Tôi không nghĩ một cái bàn nào khác sẽ vừa với lớp học này"),
  WordModel(
      word: 'blackboard',
      imageUrl:
          'https://img.freepik.com/premium-vector/blank-retro-class-blackboard-with-chalk-pieces-empty-black-chalkboard-vector-illustration-education-concept-blackboard-school-chalkboard-classroom_53562-6058.jpg?w=360',
      audioUrl:
          "https://api.dictionaryapi.dev/media/pronunciations/en/blackboard-us.mp3",
      phonetic: "/ˈblæk.bɔːrd/",
      vietnameseMeaning: "Bảng đen",
      example: "Alice rubbed the blackboard clean for the teacher.",
      translateExample: "Alice lau bảng đen cho giáo viên"),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://apicms.thestar.com.my/uploads/images/2022/05/15/1585587.jpg',
      audioUrl: "",
      phonetic: "/ˈtiː.tʃɚ/",
      vietnameseMeaning: "Giáo viên",
      example: "My mother is a teacher at our secondary school",
      translateExample: "Mẹ của tôi là giáo viên trung học"),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://img.freepik.com/free-photo/sports-teacher-gym-class_23-2149070721.jpg?w=740&t=st=1670216343~exp=1670216943~hmac=9ceed6160491580696d152d2ca122dd30b805bf4b719d6fbe5860425bb4dc2bc',
      audioUrl: "",
      phonetic: "/ˌfɪz.ɪ.kəl ed.jʊˈkeɪ.ʃən/",
      vietnameseMeaning: "Giáo viên thể dục",
      example: "My sister is a teacher at the local high school",
      translateExample:
          "Chị gái tôi là giáo viên thể dục tại trường trung học địa phương"),
  WordModel(
      word: 'student',
      imageUrl:
          'https://img.freepik.com/free-photo/happy-young-female-student-holding-notebooks-from-courses-smiling-camera-standing-spring-clothes-against-blue-background_1258-70161.jpg?w=2000',
      audioUrl: "https://api.dictionaryapi.dev/media/pronunciations/en/teacher",
      phonetic: "/ˈstuː.dənt/",
      vietnameseMeaning: "Học sinh, sinh viên",
      example: "His younger sister is a student at Harvard university",
      translateExample:
          "Em gái của anh ấy là sinh viên trường đại học Harvard"),
  WordModel(
      word: 'pencil',
      imageUrl:
          'https://img.freepik.com/premium-photo/wooden-pencil_252085-11296.jpg?w=740',
      audioUrl: "",
      phonetic: "/ˈpen.səl/",
      vietnameseMeaning: "Bút chì",
      example: "a box of coloured pencils",
      translateExample: "Một hộp bút chì màu"),
  WordModel(
      word: 'blackboard',
      imageUrl:
          'https://img.freepik.com/premium-vector/blank-retro-class-blackboard-with-chalk-pieces-empty-black-chalkboard-vector-illustration-education-concept-blackboard-school-chalkboard-classroom_53562-6058.jpg?w=360',
      audioUrl: "",
      phonetic: "/ˈblæk.bɔːrd/",
      vietnameseMeaning: "Bảng đen",
      example: "Alice rubbed the blackboard clean for the teacher.",
      translateExample: "Alice lau bảng đen cho giáo viên"),
  WordModel(
      word: 'computer',
      imageUrl:
          'https://haiphongcomputer.vn/wp-content/uploads/2020/12/oman.jpg',
      audioUrl: "",
      phonetic: "/kəmˈpjuː.t̬ɚ/",
      vietnameseMeaning: "Máy tính để bàn",
      example: "We've put all our records on computer.",
      translateExample: "Chúng tôi đã ghi tất cả số hồ sơ vào máy tính"),
  WordModel(
      word: 'fan',
      imageUrl: 'https://m.media-amazon.com/images/I/71PCDnGz7RL._SL1500_.jpg',
      audioUrl: "",
      phonetic: "/fæn/",
      vietnameseMeaning: "Cái quạt",
      example:
          "There was no air conditioning, just a ceiling fan turning slowly.",
      translateExample:
          "Không có điều hòa, chỉ có một chiếc quạt trần quay chậm."),
  WordModel(
      word: 'window',
      imageUrl:
          'https://www.eboss.co.nz/assets/ProductImages/altherm-window-systems/altherm-smartwood-box-and-bay-windows/Swood-box-and-bay__FitMaxWzEyMDAsMTIwMF0.jpg',
      audioUrl: "",
      phonetic: "/ˈwɪn.doʊ/",
      vietnameseMeaning: "Cửa sổ",
      example: "I was admiring the cathedral's stained-glass windows.",
      translateExample:
          "Tôi đang chiêm ngưỡng những cửa sổ kính màu của nhà thờ."),
];

class LessonWord {
  bool isComplete;
  List<WordModel> listWord;

  LessonWord({this.isComplete = false, this.listWord = const []});
}
final List<LessonWord> listLesson = [
  LessonWord(
    listWord: schoolWords,
  ),
  LessonWord(
    listWord: examinationWords,
  ),
  LessonWord(
    listWord: extraActivitiesWords,
  ),
  LessonWord(
    listWord: schoolStationeryWords,
  ),
  LessonWord(
    listWord: schoolSubjectWords,
  )
];
