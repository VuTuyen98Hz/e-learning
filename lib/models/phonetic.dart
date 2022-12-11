class Phonetic {
  Phonetic({
    required this.text,
    required this.audio,
  });

  String text;
  String audio;

  factory Phonetic.fromJson(Map<String, dynamic> json) =>
      Phonetic(
        text: json["text"],
        audio: json["audio"],
      );

  Map<String, dynamic> toJson() => {
    "text": text,
    "audio": audio,
  };
}
