class WordModel {
  String word;
  String imageUrl;
  String audioAsset;
  String phonetic;
  String vietnameseMeaning;
  String example;
  String translateExample;

  WordModel(
      {this.word = '',
      this.imageUrl = '',
      this.audioAsset = '',
      this.phonetic = '',
      this.vietnameseMeaning = '',
      this.example = '',
      this.translateExample = ''});

  factory WordModel.fromMap(Map data) {
    return WordModel(
      word: data['word'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      audioAsset: data['audioAsset'] ?? '',
      phonetic: data['phonetic'] ?? '',
      vietnameseMeaning: data['vietnameseMeaning'] ?? '',
      example: data['example'] ?? '',
      translateExample: data['translateExample'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'word': word,
        'imageUrl': imageUrl,
        'audioAsset': audioAsset,
        'phonetic': phonetic,
        'vietnameseMeaning': vietnameseMeaning,
        'example': example,
        'translateExample': translateExample,
      };
}
