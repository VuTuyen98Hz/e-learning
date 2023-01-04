import 'package:flutter/material.dart';

showExample({String example = '', String highlightWord = ''}) {
  int findLen(String word) {
    return word.replaceAll(RegExp(r'[a-zA-Z]'), "").length;
  }

  final longWord = highlightWord.split(" ");
  var styleNormal = const TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w300,
  );
  var styleHighlight = const TextStyle(
    color: Colors.black,
    fontSize: 20,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.w500,
  );
  return RichText(
    overflow: TextOverflow.visible,
    textAlign: TextAlign.center,
    maxLines: 4,
    text: TextSpan(
      children: example
          .split(" ")
          .map((word) => TextSpan(
              text: "$word ",
              style: findLen(word) == word.length ||
                      word.substring(0).contains(highlightWord) ||
                      longWord.contains(word.substring(0))
                  ? styleHighlight
                  : styleNormal))
          .toList(),
    ),
  );
}
