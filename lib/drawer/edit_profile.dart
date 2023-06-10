// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hostelites/utils/colors.dart';
import 'package:hostelites/widgets/show_snackbar.dart';
import 'package:hostelites/widgets/userdata.dart';

class EditProfile extends StatefulWidget {
  final String uid;
  const EditProfile({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Uint8List? _image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.uid, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text('Edit Profile'),
            Flexible(fit: FlexFit.tight, child: SizedBox()),
            Text('Save'),
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
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                          backgroundColor: secondaryColor,
                        )
                      : const CircleAvatar(
                          radius: 64,
                          child: Icon(CupertinoIcons.person),
                          backgroundColor: secondaryColor,
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              //Textfield for username
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Username',
                    style: TextStyle(fontSize: 17),
                  )),
              TextField(
                controller: TextEditingController(text: userData['username']),
              ),

              //Textfield for email
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Email Id',
                    style: TextStyle(fontSize: 17),
                  )),
              TextField(
                controller: TextEditingController(text: userData['email']),
              ),

              //Textfield for year
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Year',
                    style: TextStyle(fontSize: 17),
                  )),
              TextField(
                controller: TextEditingController(text: userData['year']),
              ),

              //Textfield for block
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Block',
                    style: TextStyle(fontSize: 17),
                  )),
              TextField(
                controller: TextEditingController(text: userData['block']),
              ),

              //Textfield for room no
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Room No.',
                    style: TextStyle(fontSize: 17),
                  )),
              TextField(
                controller: TextEditingController(text: userData['room']),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
