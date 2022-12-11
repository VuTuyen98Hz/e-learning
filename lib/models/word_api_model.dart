
import 'dart:convert';

List<BaseApi> baseApiFromJson(String str) => List<BaseApi>.from(json.decode(str).map((x) => BaseApi.fromJson(x)));

String baseApiToJson(List<BaseApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BaseApi {
  BaseApi({
    required this.word, required this.phonetic,
    required this.phonetics,
  });

  String word;
  String phonetic;
  List<Phonetic> phonetics;

  factory BaseApi.fromJson(Map<String, dynamic> json) => BaseApi(
    word: json["word"],
    phonetic: json["phonetic"],
    phonetics: List<Phonetic>.from(json["phonetics"].map((x) => Phonetic.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "word": word,
    "phonetic": phonetic,
    "phonetics": List<dynamic>.from(phonetics.map((x) => x.toJson())),
  };
}

class Phonetic {
  Phonetic({
    required this.text,
    required this.audio,
  });

  String text;
  String audio;

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
    text: json["text"],
    audio: json["audio"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "audio": audio,
  };
}
