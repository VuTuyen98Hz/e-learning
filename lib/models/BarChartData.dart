import 'package:flutter/material.dart';

class BarData {
  static int interval = 5 ;
  static List<Data> barData = [
    Data(id: 0, name: 'one', y: 10, color: Colors.greenAccent),
    Data(id: 1, name: 'two', y: 15, color: Colors.greenAccent),
    Data(id: 2, name: 'three', y: 16, color: Colors.greenAccent),
    Data(id: 4, name: 'four', y: 18, color: Colors.greenAccent),
  ];
}

class Data {
  final int id;
  final String name;
  final double y;
  final Color? color;

  Data({
    this.id = 0,
    this.name = '',
    this.y = 0.0,
    this.color,
  });

}
