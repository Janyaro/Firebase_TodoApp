import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        fontSize: 16,
        backgroundColor: Colors.blueAccent,
        gravity: ToastGravity.CENTER);
  }
}
