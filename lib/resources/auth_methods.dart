import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/show_snackbar.dart';

class MyAuthMethods {
  //creating an instance
  final FirebaseAuth _auth;
  MyAuthMethods(this._auth);
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign up user
  Future<void> mySignupUser(
      {required String email,
      required String password,
      required String username,
      required String room,
      required String year,
      required BuildContext context}) async {
    try {
      // if (email.isNotEmpty ||
      //     password.isNotEmpty ||
      //     username.isNotEmpty ||
      //     room.isNotEmpty) {
      //   //register user
      //   UserCredential cred =
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await mySendEmailVerification(context);

      //add user to the database
      //create a collection named 'users' and then make document 'uid' and  set them
      // await _firestore.collection('users').doc(cred.user!.uid).set({
      //   'username': username,
      //   'uid': cred.user!.uid,
      //   'email': email,
      //   'room': room,
      // });
      // }
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
