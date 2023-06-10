import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelites/widgets/show_snackbar.dart';

var complaintData = {};

getComplaints(String uid, String cid, BuildContext context) async {
  try {
    var snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('complaints')
        .doc(cid)
        .get();

    complaintData = snap.data()!;
    //print(complaintData);
    return complaintData;
  } catch (e) {
    print('Hello World');
    print(cid);
    myShowSnackBar(context, e.toString());
  }
}
//await FirebaseFirestore.instance.collection('users').doc(uid).get();
