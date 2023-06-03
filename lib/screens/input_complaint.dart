import 'package:flutter/material.dart';
import 'package:hostelites/utils/colors.dart';
import 'package:hostelites/widgets/text_field_input.dart';

class InputComplaint extends StatefulWidget {
  const InputComplaint({super.key});

  @override
  State<InputComplaint> createState() => InputComplaintState();
}

class InputComplaintState extends State<InputComplaint> {
  final TextEditingController _compcontrol = TextEditingController();
  final TextEditingController _roomcontrol = TextEditingController();
  final TextEditingController _usernamecontrol = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _compcontrol.dispose();
    _roomcontrol.dispose();
    _usernamecontrol.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Complaints')),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),
              //Textfield for username
              MyTextFieldInput(
                  isPass: false,
                  hinttext: 'Enter your username',
                  control: _usernamecontrol,
                  batao: TextInputType.text),
              const SizedBox(
                height: 24,
              ),
              //Textfield for room no.
              MyTextFieldInput(
                  isPass: false,
                  hinttext: 'Enter your room no.',
                  control: _roomcontrol,
                  batao: TextInputType.text),
              const SizedBox(
                height: 24,
              ),
              //Textfield for complaint
              MyTextFieldInput(
                  isPass: false,
                  hinttext: 'Enter your Complaint',
                  control: _compcontrol,
                  batao: TextInputType.text),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                //for done button
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: blueColor,
                  ),
                  child: const Text('Done'),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
