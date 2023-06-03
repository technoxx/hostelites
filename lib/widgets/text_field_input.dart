import 'package:flutter/material.dart';
import 'package:hostelites/utils/colors.dart';

class MyTextFieldInput extends StatelessWidget {
  final TextEditingController control;
  final bool isPass;
  final String hinttext;
  final TextInputType batao;

  const MyTextFieldInput(
      {Key? key,
      required this.isPass,
      required this.hinttext,
      required this.control,
      required this.batao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: control,
      decoration: InputDecoration(
        hintText: hinttext,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: mainColor)),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: mainColor)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: mainColor)),
        filled: true,
      ),
      keyboardType: batao,
      obscureText: isPass,
    );
  }
}
