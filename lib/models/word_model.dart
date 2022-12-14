class WordModel {
  String word;
  String imageUrl;
  String audioAsset;
  String phonetic;
  String vietnameseMeaning;
  String example;
  String translateExample;
  bool didUserRememberThisWord;

  WordModel(
      {this.word = '',
      this.imageUrl = '',
      this.audioAsset = '',
      this.phonetic = '',
      this.vietnameseMeaning = '',
      this.example = '',
      this.translateExample = '',
      this.didUserRememberThisWord = false});
}

final List<WordModel> schoolWords = [
  WordModel(
      word: 'student',
      imageUrl:
          'https://img.freepik.com/premium-photo/young-asian-woman-using-smartphone-street_296537-5304.jpg?w=740',
      audioAsset: 'audio/lesson/school/student.mp3',
      phonetic: '/ˈskuːl.jɑːrd/',
      vietnameseMeaning: "Học sinh, sinh viên",
      example: 'She is the best student in school and is loved by everyone',
      translateExample:
          'Cô là học sinh giỏi nhất trường và được mọi người yêu mến'),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://img.freepik.com/premium-photo/young-asian-teacher-woman-teaching-holding-book-video-conference-with-student-looking-camera-female-teacher-training-mathematics-classroom-blackboard-from-online-course_208349-1803.jpg?w=740',
      audioAsset: 'audio/lesson/school/teacher.mp3',
      phonetic: '/ˈtiː.tʃɚ/',
      vietnameseMeaning: "Giáo viên",
      example:
          'Although the teacher seems strict, she really loves her students',
      translateExample:
          'Cô giáo tuy có vẻ nghiêm khắc nhưng lại rất yêu thương học sinh'),
  WordModel(
      word: 'lesson',
      imageUrl:
          'https://blog.planbook.com/wp-content/uploads/2017/04/high-school-1072x715.jpg',
      audioAsset: 'audio/lesson/school/lesson.mp3',
      phonetic: '/ˈles.ən/',
      vietnameseMeaning: "Tiết học, bài học",
      example: "Mr. Johnson's lessons always make us excited",
      translateExample:
          'Những bài học của thầy Johnson luôn khiến chúng tôi thích thú'),
  WordModel(
      word: 'library',
      imageUrl:
          'https://img.freepik.com/premium-photo/stack-books-library-desk_23-2147845946.jpg?w=740',
      audioAsset: 'audio/lesson/school/library.mp3',
      phonetic: ' /ˈlaɪ.brer.i/',
      vietnameseMeaning: "Thư viện",
      example: 'My school library is the largest library in the area',
      translateExample:
          'Thư viện trường tôi là thư viện lớn nhất trong khu vực'),
  WordModel(
      word: 'principal',
      imageUrl:
          'https://www.thoughtco.com/thmb/2AcTcEVKWfinOU7JhOfBcmkhK8k=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/480811293-56a939853df78cf772a4ecb8.jpg',
      audioAsset: 'audio/lesson/school/principal.mp3',
      phonetic: '/ˈprɪn.sə.pəl/',
      vietnameseMeaning: "Thầy hiệu trưởng",
      example:
          'For Principal Michael, his educational journey has been a long but meaningful one',
      translateExample:
          'For Principal Michael, his educational journey has been a long but meaningful one'),
  WordModel(
      word: 'exam',
      imageUrl:
          'https://img.freepik.com/free-photo/asian-student-woman-reads-books-library-university_7861-3535.jpg?w=900&t=st=1670744252~exp=1670744852~hmac=633e580976d158e1acabec693777702df788b99e13796e15618514eadeeacdf5',
      audioAsset: 'audio/lesson/school/exam.mp3',
      phonetic: '/ɪɡˌzæm.əˈneɪ.ʃən/',
      vietnameseMeaning: "Thi cử",
      example:
          'She always has to stay up late to prepare for the upcoming exam',
      translateExample:
          'Trước mỗi kỳ thi, cô thường thức rất khuya để học bài'),
  WordModel(
      word: 'classroom',
      imageUrl:
          'https://img.freepik.com/free-photo/students-knowing-right-answer_329181-14271.jpg?w=740&t=st=1670745383~exp=1670745983~hmac=88f33329e258a7f6bb2a1cf1ed22cce01b914626828182864e5d5e20dfcb2036',
      audioAsset: 'audio/lesson/school/classroom.mp3',
      phonetic: '/ˈklæs.rʊm/',
      vietnameseMeaning: "Lớp học",
      example: 'Students are studying in the classroom.',
      translateExample: 'Học sinh đang học trong lớp.'),
  WordModel(
      word: 'canteen',
      imageUrl:
          'https://img.freepik.com/premium-vector/school-canteen-with-different-races-pupils-protective-masks-flat-illustration_318844-70.jpg?w=740',
      audioAsset: 'audio/lesson/school/canteen.mp3',
      phonetic: '/kænˈtiːn/',
      vietnameseMeaning: "Căng tin",
      example: 'Her mother worked as an assistant in a school canteen.',
      translateExample: 'Mẹ cô làm trợ lý trong căng tin trường học.'),
  WordModel(
      word: 'gymnasium',
      imageUrl:
          'https://img.freepik.com/premium-vector/cartoon-school-court-gym-with-basketball-basket-football-goal-gymnastic-equipment-comfortable-playground-playing-games-training-vector-gymnasium-sport-hall-workout_176516-3686.jpg?w=900',
      audioAsset: 'audio/lesson/school/gymnasium.mp3',
      phonetic: '/dʒɪmˈneɪ.zi.əm/',
      vietnameseMeaning: "Phòng thể chất",
      example: 'Dance classes are held in the high school gymnasium',
      translateExample:
          'Các lớp khiêu vũ được tổ chức trong phòng tập thể dục của trường trung học.'),
  WordModel(
      word: 'schoolyard',
      imageUrl:
          'https://dictionary.cambridge.org/images/full/school_noun_002_32386.jpg?version=5.0.285',
      audioAsset: 'audio/lesson/school/schoolyard.mp3',
      phonetic: '/ˈskuːl.jɑːrd/',
      vietnameseMeaning: "Sân Trường",
      example:
          'As soon as the bell rang, the children rushed to the school yard',
      translateExample: 'Chuông vừa reo, lũ trẻ ùa ra sân trường'),
];
final List<WordModel> examinationWords = [
  WordModel(
      word: 'computer',
      imageUrl:
          'https://haiphongcomputer.vn/wp-content/uploads/2020/12/oman.jpg',
      audioAsset: "",
      phonetic: "/kəmˈpjuː.t̬ɚ/",
      vietnameseMeaning: "Máy tính để bàn",
      example: "We've put all our records on computer.",
      translateExample: "Chúng tôi đã ghi tất cả số hồ sơ vào máy tính"),
  WordModel(
      word: 'fan',
      imageUrl: 'https://m.media-amazon.com/images/I/71PCDnGz7RL._SL1500_.jpg',
      audioAsset: "",
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
      audioAsset: "",
      phonetic: "/ˈtiː.tʃɚ/",
      vietnameseMeaning: "Giáo viên",
      example: "My mother is a teacher at our secondary school",
      translateExample: "Mẹ của tôi là giáo viên trung học"),
  WordModel(
      word: 'window',
      imageUrl:
          'https://www.eboss.co.nz/assets/ProductImages/altherm-window-systems/altherm-smartwood-box-and-bay-windows/Swood-box-and-bay__FitMaxWzEyMDAsMTIwMF0.jpg',
      audioAsset: "",
      phonetic: "/ˈwɪn.doʊ/",
      vietnameseMeaning: "Cửa sổ",
      example: "I was admiring the cathedral's stained-glass windows.",
      translateExample:
          "Tôi đang chiêm ngưỡng những cửa sổ kính màu của nhà thờ."),
  WordModel(
      word: 'classroom',
      imageUrl:
          'https://www.responsiveclassroom.org/wp-content/uploads/2016/04/DSC_2388-1024x682.jpg',
      audioAsset:
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
      audioAsset:
          "https://api.dictionaryapi.dev/media/pronunciations/en/blackboard-us.mp3",
      phonetic: "/ˈblæk.bɔːrd/",
      vietnameseMeaning: "Bảng đen",
      example: "Alice rubbed the blackboard clean for the teacher.",
      translateExample: "Alice lau bảng đen cho giáo viên"),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://img.freepik.com/free-photo/sports-teacher-gym-class_23-2149070721.jpg?w=740&t=st=1670216343~exp=1670216943~hmac=9ceed6160491580696d152d2ca122dd30b805bf4b719d6fbe5860425bb4dc2bc',
      audioAsset: "",
      phonetic: "/ˌfɪz.ɪ.kəl ed.jʊˈkeɪ.ʃən/",
      vietnameseMeaning: "Giáo viên thể dục",
      example: "My sister is a teacher at the local high school",
      translateExample:
          "Chị gái tôi là giáo viên thể dục tại trường trung học địa phương"),
  WordModel(
      word: 'student',
      imageUrl:
          'https://img.freepik.com/free-photo/happy-young-female-student-holding-notebooks-from-courses-smiling-camera-standing-spring-clothes-against-blue-background_1258-70161.jpg?w=2000',
      audioAsset:
          "https://api.dictionaryapi.dev/media/pronunciations/en/teacher",
      phonetic: "/ˈstuː.dənt/",
      vietnameseMeaning: "Học sinh, sinh viên",
      example: "His younger sister is a student at Harvard university",
      translateExample:
          "Em gái của anh ấy là sinh viên trường đại học Harvard"),
  WordModel(
      word: 'pencil',
      imageUrl:
          'https://img.freepik.com/premium-photo/wooden-pencil_252085-11296.jpg?w=740',
      audioAsset: "",
      phonetic: "/ˈpen.səl/",
      vietnameseMeaning: "Bút chì",
      example: "a box of coloured pencils",
      translateExample: "Một hộp bút chì màu"),
  WordModel(
      word: 'blackboard',
      imageUrl:
          'https://img.freepik.com/premium-vector/blank-retro-class-blackboard-with-chalk-pieces-empty-black-chalkboard-vector-illustration-education-concept-blackboard-school-chalkboard-classroom_53562-6058.jpg?w=360',
      audioAsset: "",
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
      audioAsset:
          "https://api.dictionaryapi.dev/media/pronunciations/en/teacher",
      phonetic: "/ˈstuː.dənt/",
      vietnameseMeaning: "Học sinh, sinh viên",
      example: "His younger sister is a student at Harvard university",
      translateExample:
          "Em gái của anh ấy là sinh viên trường đại học Harvard"),
  WordModel(
      word: 'computer',
      imageUrl:
          'https://haiphongcomputer.vn/wp-content/uploads/2020/12/oman.jpg',
      audioAsset:
          "https://api.dictionaryapi.dev/media/pronunciations/en/computer-uk.mp3",
      phonetic: "/kəmˈpjuː.t̬ɚ/",
      vietnameseMeaning: "Máy tính để bàn",
      example: "We've put all our records on computer.",
      translateExample: "Chúng tôi đã ghi tất cả số hồ sơ vào máy tính"),
  WordModel(
      word: 'fan',
      imageUrl: 'https://m.media-amazon.com/images/I/71PCDnGz7RL._SL1500_.jpg',
      audioAsset:
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
      audioAsset:
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
      audioAsset:
          "https://api.dictionaryapi.dev/media/pronunciations/en/pencil-us.mp3",
      phonetic: "/ˈpen.səl/",
      vietnameseMeaning: "Bút chì",
      example: "a box of coloured pencils",
      translateExample: "Một hộp bút chì màu"),
  WordModel(
      word: 'classroom',
      imageUrl:
          'https://www.responsiveclassroom.org/wp-content/uploads/2016/04/DSC_2388-1024x682.jpg',
      audioAsset:
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
      audioAsset:
          "https://api.dictionaryapi.dev/media/pronunciations/en/blackboard-us.mp3",
      phonetic: "/ˈblæk.bɔːrd/",
      vietnameseMeaning: "Bảng đen",
      example: "Alice rubbed the blackboard clean for the teacher.",
      translateExample: "Alice lau bảng đen cho giáo viên"),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://apicms.thestar.com.my/uploads/images/2022/05/15/1585587.jpg',
      audioAsset:
          "https://api.dictionaryapi.dev/media/pronunciations/en/teacher-uk.mp3",
      phonetic: "/ˈtiː.tʃɚ/",
      vietnameseMeaning: "Giáo viên",
      example: "My mother is a teacher at our secondary school",
      translateExample: "Mẹ của tôi là giáo viên trung học"),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://img.freepik.com/free-photo/sports-teacher-gym-class_23-2149070721.jpg?w=740&t=st=1670216343~exp=1670216943~hmac=9ceed6160491580696d152d2ca122dd30b805bf4b719d6fbe5860425bb4dc2bc',
      audioAsset:
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
      audioAsset:
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
      audioAsset:
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
      audioAsset:
          "https://api.dictionaryapi.dev/media/pronunciations/en/blackboard-us.mp3",
      phonetic: "/ˈblæk.bɔːrd/",
      vietnameseMeaning: "Bảng đen",
      example: "Alice rubbed the blackboard clean for the teacher.",
      translateExample: "Alice lau bảng đen cho giáo viên"),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://apicms.thestar.com.my/uploads/images/2022/05/15/1585587.jpg',
      audioAsset: "",
      phonetic: "/ˈtiː.tʃɚ/",
      vietnameseMeaning: "Giáo viên",
      example: "My mother is a teacher at our secondary school",
      translateExample: "Mẹ của tôi là giáo viên trung học"),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://img.freepik.com/free-photo/sports-teacher-gym-class_23-2149070721.jpg?w=740&t=st=1670216343~exp=1670216943~hmac=9ceed6160491580696d152d2ca122dd30b805bf4b719d6fbe5860425bb4dc2bc',
      audioAsset: "",
      phonetic: "/ˌfɪz.ɪ.kəl ed.jʊˈkeɪ.ʃən/",
      vietnameseMeaning: "Giáo viên thể dục",
      example: "My sister is a teacher at the local high school",
      translateExample:
          "Chị gái tôi là giáo viên thể dục tại trường trung học địa phương"),
  WordModel(
      word: 'student',
      imageUrl:
          'https://img.freepik.com/free-photo/happy-young-female-student-holding-notebooks-from-courses-smiling-camera-standing-spring-clothes-against-blue-background_1258-70161.jpg?w=2000',
      audioAsset:
          "https://api.dictionaryapi.dev/media/pronunciations/en/teacher",
      phonetic: "/ˈstuː.dənt/",
      vietnameseMeaning: "Học sinh, sinh viên",
      example: "His younger sister is a student at Harvard university",
      translateExample:
          "Em gái của anh ấy là sinh viên trường đại học Harvard"),
  WordModel(
      word: 'pencil',
      imageUrl:
          'https://img.freepik.com/premium-photo/wooden-pencil_252085-11296.jpg?w=740',
      audioAsset: "",
      phonetic: "/ˈpen.səl/",
      vietnameseMeaning: "Bút chì",
      example: "a box of coloured pencils",
      translateExample: "Một hộp bút chì màu"),
  WordModel(
      word: 'blackboard',
      imageUrl:
          'https://img.freepik.com/premium-vector/blank-retro-class-blackboard-with-chalk-pieces-empty-black-chalkboard-vector-illustration-education-concept-blackboard-school-chalkboard-classroom_53562-6058.jpg?w=360',
      audioAsset: "",
      phonetic: "/ˈblæk.bɔːrd/",
      vietnameseMeaning: "Bảng đen",
      example: "Alice rubbed the blackboard clean for the teacher.",
      translateExample: "Alice lau bảng đen cho giáo viên"),
  WordModel(
      word: 'computer',
      imageUrl:
          'https://haiphongcomputer.vn/wp-content/uploads/2020/12/oman.jpg',
      audioAsset: "",
      phonetic: "/kəmˈpjuː.t̬ɚ/",
      vietnameseMeaning: "Máy tính để bàn",
      example: "We've put all our records on computer.",
      translateExample: "Chúng tôi đã ghi tất cả số hồ sơ vào máy tính"),
  WordModel(
      word: 'fan',
      imageUrl: 'https://m.media-amazon.com/images/I/71PCDnGz7RL._SL1500_.jpg',
      audioAsset: "",
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
      audioAsset: "",
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
      audioAsset:
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
      audioAsset:
          "https://api.dictionaryapi.dev/media/pronunciations/en/blackboard-us.mp3",
      phonetic: "/ˈblæk.bɔːrd/",
      vietnameseMeaning: "Bảng đen",
      example: "Alice rubbed the blackboard clean for the teacher.",
      translateExample: "Alice lau bảng đen cho giáo viên"),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://apicms.thestar.com.my/uploads/images/2022/05/15/1585587.jpg',
      audioAsset: "",
      phonetic: "/ˈtiː.tʃɚ/",
      vietnameseMeaning: "Giáo viên",
      example: "My mother is a teacher at our secondary school",
      translateExample: "Mẹ của tôi là giáo viên trung học"),
  WordModel(
      word: 'teacher',
      imageUrl:
          'https://img.freepik.com/free-photo/sports-teacher-gym-class_23-2149070721.jpg?w=740&t=st=1670216343~exp=1670216943~hmac=9ceed6160491580696d152d2ca122dd30b805bf4b719d6fbe5860425bb4dc2bc',
      audioAsset: "",
      phonetic: "/ˌfɪz.ɪ.kəl ed.jʊˈkeɪ.ʃən/",
      vietnameseMeaning: "Giáo viên thể dục",
      example: "My sister is a teacher at the local high school",
      translateExample:
          "Chị gái tôi là giáo viên thể dục tại trường trung học địa phương"),
  WordModel(
      word: 'student',
      imageUrl:
          'https://img.freepik.com/free-photo/happy-young-female-student-holding-notebooks-from-courses-smiling-camera-standing-spring-clothes-against-blue-background_1258-70161.jpg?w=2000',
      audioAsset:
          "https://api.dictionaryapi.dev/media/pronunciations/en/teacher",
      phonetic: "/ˈstuː.dənt/",
      vietnameseMeaning: "Học sinh, sinh viên",
      example: "His younger sister is a student at Harvard university",
      translateExample:
          "Em gái của anh ấy là sinh viên trường đại học Harvard"),
  WordModel(
      word: 'pencil',
      imageUrl:
          'https://img.freepik.com/premium-photo/wooden-pencil_252085-11296.jpg?w=740',
      audioAsset: "",
      phonetic: "/ˈpen.səl/",
      vietnameseMeaning: "Bút chì",
      example: "a box of coloured pencils",
      translateExample: "Một hộp bút chì màu"),
  WordModel(
      word: 'blackboard',
      imageUrl:
          'https://img.freepik.com/premium-vector/blank-retro-class-blackboard-with-chalk-pieces-empty-black-chalkboard-vector-illustration-education-concept-blackboard-school-chalkboard-classroom_53562-6058.jpg?w=360',
      audioAsset: "",
      phonetic: "/ˈblæk.bɔːrd/",
      vietnameseMeaning: "Bảng đen",
      example: "Alice rubbed the blackboard clean for the teacher.",
      translateExample: "Alice lau bảng đen cho giáo viên"),
  WordModel(
      word: 'computer',
      imageUrl:
          'https://haiphongcomputer.vn/wp-content/uploads/2020/12/oman.jpg',
      audioAsset: "",
      phonetic: "/kəmˈpjuː.t̬ɚ/",
      vietnameseMeaning: "Máy tính để bàn",
      example: "We've put all our records on computer.",
      translateExample: "Chúng tôi đã ghi tất cả số hồ sơ vào máy tính"),
  WordModel(
      word: 'fan',
      imageUrl: 'https://m.media-amazon.com/images/I/71PCDnGz7RL._SL1500_.jpg',
      audioAsset: "",
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
      audioAsset: "",
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
