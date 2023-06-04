import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelites/screens/input_complaint.dart';
import 'package:hostelites/widgets/tile.dart';
import 'package:intl/intl.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('complaints');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: const Center(child: Text('Complaints')),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: ref.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map data = snapshot.data!.docs[index].data() as Map;
                DateTime mydateTime = data['created'].toDate();
                String formattedTime =
                    DateFormat.yMMMd().add_jm().format(mydateTime);
                return MyTile(
                  data: data,
                  date: formattedTime,
                  ref: snapshot.data!.docs[index].reference,
                );
              },
            );
          } else {
            return const Center(
              child: Text('Loading...'),
            );
          }
        },
      ),
    );
  }
}
