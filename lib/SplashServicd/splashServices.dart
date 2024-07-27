import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_app/View/viewNoteScreen.dart';

class SplashService {
  void isLogin(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ViewNoteScreen()));
    });
  }
}
