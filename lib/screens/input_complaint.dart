import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelites/utils/colors.dart';
import 'package:hostelites/widgets/show_snackbar.dart';
import 'package:hostelites/widgets/text_field_input.dart';

class InputComplaint extends StatefulWidget {
  InputComplaint({super.key});

  @override
  State<InputComplaint> createState() => InputComplaintState();
}

class InputComplaintState extends State<InputComplaint> {
  final TextEditingController _compcontrol = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _compcontrol.dispose();
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
                  if (_compcontrol.text.isEmpty) {
                    return;
                  } else {
                    add();
                    myShowSnackBar(context,
                        'Recorded! You can view it in the Complaints Page');
                  }
                },
                //for done button
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: mainColor,
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  void add() async {
    //save to database
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('complaints');

    var data = {
      'issue': _compcontrol.text,
      'created': DateTime.now(),
    };

    ref.add(data);
    Navigator.pop(context);
  }
}
