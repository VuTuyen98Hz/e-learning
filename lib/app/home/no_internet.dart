import 'package:flutter/material.dart';

Widget noInternet() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      AspectRatio(
          aspectRatio: 465 / 500,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                fit: BoxFit.fitHeight,
                alignment: FractionalOffset.topCenter,
                image: AssetImage("assets/images/no_internet.jpg"),
              ),
            ),
          )),
      const Text("Oops! kết nối mạng có vấn đề rồi, hãy kiểm tra lại nhé!",
          style: TextStyle(fontSize: 20)),
    ]),
  );
}
