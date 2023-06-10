// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostelites/widgets/show_snackbar.dart';

var userData = {};

getData(String uid, BuildContext context) async {
  try {
    var snap =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    userData = snap.data()!;
    return userData;
  } catch (e) {
    myShowSnackBar(context, e.toString());
  }
}
