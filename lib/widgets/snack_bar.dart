import 'package:flutter/material.dart';

class GlobalSnackBar {

  final String message;
  final BuildContext buildContext;

  const GlobalSnackBar({required this.message , required this.buildContext});
  static showSnackBack(BuildContext context , String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {

        },
      ),
    ));
  }


}