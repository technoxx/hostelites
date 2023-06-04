import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostelites/screens/view_complaint.dart';
import 'package:hostelites/utils/colors.dart';

class MyTile extends StatelessWidget {
  final Map data;
  final String date;
  final DocumentReference ref;
  const MyTile(
      {Key? key, required this.data, required this.date, required this.ref})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        onLongPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ViewComplaint(data, ref, date)));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: secondaryColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        title: Text(
          data['issue'],
          style: const TextStyle(
            color: mainColor,
            fontSize: 20,
          ),
          maxLines: 10,
        ),
        subtitle: Wrap(spacing: 10.0, children: <Widget>[
          Chip(
            labelPadding: EdgeInsets.zero,
            label: Text(
              data['username'],
              style: const TextStyle(
                color: highlightColor,
                fontSize: 15,
              ),
            ),
          ),
          Chip(
            label: Text(
              data['room'],
              style: const TextStyle(
                color: highlightColor,
                fontSize: 15,
              ),
            ),
          ),
          Chip(
            label: Text(
              data['year'],
              style: const TextStyle(
                color: highlightColor,
                fontSize: 15,
              ),
            ),
          ),
          Chip(
            label: Text(
              data['block'],
              style: const TextStyle(
                color: highlightColor,
                fontSize: 15,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              date,
              style: const TextStyle(
                color: highlightColor,
                fontSize: 18,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
