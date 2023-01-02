class WordModel {
  String word;
  String imageAsset;
  String audioAsset;
  String phonetic;
  String vietnameseMeaning;
  String example;
  String translateExample;

  WordModel(
      {this.word = '',
      this.imageAsset = '',
      this.audioAsset = '',
      this.phonetic = '',
      this.vietnameseMeaning = '',
      this.example = '',
      this.translateExample = ''});

  factory WordModel.fromMap(Map data) {
    return WordModel(
      word: data['word'] ?? '',
      imageAsset: data['imageAsset'] ?? '',
      audioAsset: data['audioAsset'] ?? '',
      phonetic: data['phonetic'] ?? '',
      vietnameseMeaning: data['vietnameseMeaning'] ?? '',
      example: data['example'] ?? '',
      translateExample: data['translateExample'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'word': word,
        'imageUrl': imageAsset,
        'audioAsset': audioAsset,
        'phonetic': phonetic,
        'vietnameseMeaning': vietnameseMeaning,
        'example': example,
        'translateExample': translateExample,
      };
}
