import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hostelites/resources/storage_methods.dart';
import 'package:hostelites/screens/navbar.dart';

import '../widgets/show_snackbar.dart';

class MyAuthMethods {
  //creating an instance
  final FirebaseAuth _auth;
  MyAuthMethods(this._auth);
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign up user
  Future<void> mySignupUser(
      {required String email,
      required String password,
      required String username,
      required String room,
      required String year,
      required String block,
      required Uint8List file,
      required BuildContext context}) async {
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          room.isNotEmpty ||
          block.isNotEmpty ||
          file != null) {
        //register user
        final UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        final User? user = cred.user;

        String photourl =
            await StorageMethods().myUploadImageToStorage('profilePic', file);

        var userData = {
          'username': username,
          'uid': user!.uid,
          'password': password,
          'email': email,
          'room': room,
          'block': block,
          'year': year,
          'photourl': photourl,
        };

        users.doc(user.uid).get().then((doc) {
          if (doc.exists) {
            //old user
            doc.reference.update(userData);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavBar()),
            );
          } else {
            //new user
            users.doc(user.uid).set(userData);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavBar()),
            );
          }
        });

        //await mySendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      myShowSnackBar(context, e.message!);
    }
  }

  //Email Login
  Future<void> myLoginWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        await mySendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      myShowSnackBar(context, e.message!);
    }
  }

  //Email Verification
  Future<void> mySendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      myShowSnackBar(context, 'Email Verification link sent!');
    } on FirebaseAuthException catch (e) {
      myShowSnackBar(context, e.message!);
    }
  }
}
