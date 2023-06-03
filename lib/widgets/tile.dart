import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final String uname;
  final String year;
  final String room;
  final String block;
  final String comp;

  const MyTile(
      {Key? key,
      required this.uname,
      required this.year,
      required this.room,
      required this.block,
      required this.comp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.green,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        title: Text(
          comp,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(uname), Text(room), Text(year), Text(block)]),
      ),
    );
  }
}
