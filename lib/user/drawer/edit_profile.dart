// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelites/user/resources/storage_methods.dart';

import 'package:hostelites/utils/colors.dart';
import 'package:hostelites/user/userdata.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/utils.dart';

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
  final TextEditingController _emailcontrol = TextEditingController();
  final TextEditingController _passcontrol = TextEditingController();
  final TextEditingController _roomcontrol = TextEditingController();
  final TextEditingController _usernamecontrol = TextEditingController();
  final TextEditingController _yearcontrol = TextEditingController();
  final TextEditingController _blockcontrol = TextEditingController();

  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailcontrol.dispose();
    _passcontrol.dispose();
    _roomcontrol.dispose();
    _usernamecontrol.dispose();
  }

  DocumentReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.uid, context);
  }

  void selectImage() async {
    Uint8List? im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Edit Profile'),
            Flexible(fit: FlexFit.tight, child: SizedBox()),
            InkWell(
              onTap: () async {
                String photourl = await StorageMethods()
                    .myUploadImageToStorage('profilePic', _image);
                await ref.update({
                  'username': _usernamecontrol.text.trim(),
                  'password': _passcontrol.text.trim(),
                  'email': _emailcontrol.text.trim(),
                  'room': _roomcontrol.text.trim(),
                  'block': _blockcontrol.text.trim(),
                  'year': _yearcontrol.text.trim(),
                  'photourl': photourl,
                }).then((value) => Navigator.of(context).pop());
              },
              child: Text('Save'),
            ),
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
                      : CircleAvatar(
                          backgroundColor: secondaryColor,
                          radius: 64,
                          backgroundImage: NetworkImage(userData['photourl']),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
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
                controller: _usernamecontrol..text = "${userData['username']}",
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
                controller: _emailcontrol..text = "${userData['email']}",
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
                controller: _yearcontrol..text = "${userData['year']}",
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
                controller: _blockcontrol..text = "${userData['block']}",
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
                controller: _roomcontrol..text = "${userData['room']}",
              ),

              //Textfield for password
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Password',
                    style: TextStyle(fontSize: 17),
                  )),
              TextField(
                controller: _passcontrol..text = "${userData['password']}",
              ),
            ],
          ),
        ),
      )),
    );
  }
}
