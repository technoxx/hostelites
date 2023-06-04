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
  final TextEditingController _roomcontrol = TextEditingController();
  final TextEditingController _usernamecontrol = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _compcontrol.dispose();
    _roomcontrol.dispose();
    _usernamecontrol.dispose();
  }

  String yearvalue = 'Select your Year';
  var items = [
    'Select your Year',
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year'
  ];

  String blockvalue = 'Select your Block';
  var block = ['Select your Block', 'A-Block', 'B-Block', 'C-Block'];

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
                  hinttext: 'Enter your Username',
                  control: _usernamecontrol,
                  batao: TextInputType.text),
              const SizedBox(
                height: 24,
              ),
              //Textfield for year
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: DropdownButtonFormField(
                    value: yearvalue,
                    onChanged: (String? newValue) {
                      setState(() {
                        yearvalue = newValue!;
                      });
                    },
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              //Textfield for room no.
              MyTextFieldInput(
                  isPass: false,
                  hinttext: 'Enter your Room No.',
                  control: _roomcontrol,
                  batao: TextInputType.text),
              const SizedBox(
                height: 24,
              ),
              //Textfield for block
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: DropdownButtonFormField(
                    value: blockvalue,
                    onChanged: (String? newValue1) {
                      setState(() {
                        blockvalue = newValue1!;
                      });
                    },
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: block.map((String block) {
                      return DropdownMenuItem(
                        value: block,
                        child: Text(block),
                      );
                    }).toList(),
                  ),
                ),
              ),
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
                  if (_usernamecontrol.text.isEmpty ||
                      _roomcontrol.text.isEmpty ||
                      _compcontrol.text.isEmpty ||
                      yearvalue.isEmpty ||
                      blockvalue.isEmpty) {
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
      'username': _usernamecontrol.text,
      'room': _roomcontrol.text,
      'block': blockvalue,
      'year': yearvalue,
      'issue': _compcontrol.text,
      'created': DateTime.now(),
    };

    ref.add(data);
    Navigator.pop(context);
  }
}
