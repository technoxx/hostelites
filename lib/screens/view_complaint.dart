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
  @override
  void dispose() {
    super.dispose();
    _compcontrol.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Edit'),
            Flexible(fit: FlexFit.tight, child: SizedBox()),
            InkWell(
              onTap: () {},
              child: Text('Save'),
            )
          ],
        ),
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
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Complaint',
                    style: TextStyle(fontSize: 17),
                  )),
              TextField(
                controller: TextEditingController(text: widget.data['issue']),
              ),

              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
