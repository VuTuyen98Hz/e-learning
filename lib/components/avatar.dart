import 'package:flutter/material.dart';
import 'package:learn_japanese/models/models.dart';

class Avatar extends StatelessWidget {
  Avatar(
    this.user,
  );

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    if (user.photoUrl == '') {
      return Hero(
        tag: 'App Logo',
        child: CircleAvatar(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.transparent,
            radius: 60.0,
            child: ClipOval(
              child: Image.asset(
                'assets/images/default_avatar.jpg',
                fit: BoxFit.cover,
                width: 120.0,
                height: 120.0,
              ),
            )),
      );

      // LogoGraphicHeader();
    }
    return Hero(
      tag: 'User Avatar Image',
      child: CircleAvatar(
          foregroundColor: Colors.blue,
          backgroundColor: Colors.white,
          radius: 70.0,
          child: ClipOval(
            child: Image.network(
              user.photoUrl,
              fit: BoxFit.cover,
              width: 120.0,
              height: 120.0,
            ),
          )),
    );
  }
}
