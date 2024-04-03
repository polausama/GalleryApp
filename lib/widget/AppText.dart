import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String? text;
  double? fontsize;
  TextAlign?textAlign;
   AppText({this.text,this.fontsize,this.textAlign });

  @override
  Widget build(BuildContext context) {
    return Text(text!, textAlign:textAlign ,style: TextStyle(
                  fontSize: fontsize,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(74, 74, 74, 1)));
  }
}