import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar(this.photoUrl, {super.key});

  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    if (photoUrl == '') {
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
              photoUrl,
              fit: BoxFit.cover,
              width: 120.0,
              height: 120.0,
            ),
          )),
    );
  }
}
