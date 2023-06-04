import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelites/utils/colors.dart';
import 'package:hostelites/widgets/show_snackbar.dart';
import 'package:hostelites/widgets/text_field_input.dart';

class ViewComplaint extends StatefulWidget {
  final Map data;
  final String time;
  final DocumentReference ref;
  ViewComplaint(this.data, this.ref, this.time);

  @override
  State<ViewComplaint> createState() => _ViewComplaintState();
}

class _ViewComplaintState extends State<ViewComplaint> {
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
        title: Text('Edit/Delete'),
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
              TextField(
                decoration: InputDecoration(hintText: widget.data['username']),
              ),
              const SizedBox(
                height: 24,
              ),
              //Textfield for year
              TextField(
                decoration: InputDecoration(
                  hintText: widget.data['year'],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              //Textfield for room no.
              TextField(
                decoration: InputDecoration(hintText: widget.data['room']),
              ),
              const SizedBox(
                height: 24,
              ),
              //Textfield for block
              TextField(
                decoration: InputDecoration(hintText: widget.data['block']),
              ),
              const SizedBox(
                height: 24,
              ),
              //Textfield for complaint
              TextField(
                decoration: InputDecoration(hintText: widget.data['issue']),
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  del();
                  myShowSnackBar(context, 'Deleted Successfully!');
                },
                //for delete button
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: mainColor,
                  ),
                  child: const Text(
                    'Delete',
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

  void del() async {
    //delete from database
    await widget.ref.delete();
    Navigator.pop(context);
  }
}
