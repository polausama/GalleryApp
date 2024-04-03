import 'package:flutter/material.dart';

class Custom_Text_Field extends StatelessWidget {
  String? hintName;
  final bool ispass;
  final void Function(String? value)? saved;
  final String? Function(String?) validator;
  double?fontSize;

  Custom_Text_Field(
      {this.hintName,
      this.saved,
      required this.validator,
      this.ispass = false,
      this.fontSize});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: ispass,
      onSaved: saved,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color:  Color(707070))
                    ),
        focusedBorder:
         OutlineInputBorder(
           borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color:  Color(707070)),
          ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: Colors.red),
        ),
        hintText: hintName,
        hintStyle: TextStyle(fontSize: fontSize),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
