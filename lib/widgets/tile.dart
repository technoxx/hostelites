import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hostelites/user/screens/view_complaint.dart';
import 'package:hostelites/utils/colors.dart';
import 'package:hostelites/widgets/show_snackbar.dart';
import 'package:hostelites/user/userdata.dart';

class MyTile extends StatefulWidget {
  final Map data;
  final String date;
  final DocumentReference ref;
  const MyTile(
      {Key? key, required this.data, required this.date, required this.ref})
      : super(key: key);

  @override
  State<MyTile> createState() => _MyTileState();
}

class _MyTileState extends State<MyTile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(FirebaseAuth.instance.currentUser!.uid, context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            icon: CupertinoIcons.delete,
            backgroundColor: Colors.red,
            onPressed: (context) =>
                {del(), myShowSnackBar(context, 'Deleted Successfully!')},
          ),
          SlidableAction(
            icon: CupertinoIcons.pencil,
            backgroundColor: highlightColor,
            onPressed: (context) => {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (context) =>
                          ViewComplaint(widget.data, widget.ref, widget.date)))
                  .then((_) {
                setState(() {});
              }),
            },
          ),
        ]),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: secondaryColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          title: Text(
            widget.data['issue'],
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
                userData['username'],
                style: const TextStyle(
                  color: highlightColor,
                  fontSize: 15,
                ),
              ),
            ),
            Chip(
              label: Text(
                userData['room'],
                style: const TextStyle(
                  color: highlightColor,
                  fontSize: 15,
                ),
              ),
            ),
            Chip(
              label: Text(
                userData['year'],
                style: const TextStyle(
                  color: highlightColor,
                  fontSize: 15,
                ),
              ),
            ),
            Chip(
              label: Text(
                userData['block'],
                style: const TextStyle(
                  color: highlightColor,
                  fontSize: 15,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                widget.date,
                style: const TextStyle(
                  color: highlightColor,
                  fontSize: 18,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void del() async {
    //delete from database
    await widget.ref.delete();
  }
}
