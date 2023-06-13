import 'package:flutter/material.dart';

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
      ),
      keyboardType: batao,
      obscureText: isPass,
    );
  }
}
