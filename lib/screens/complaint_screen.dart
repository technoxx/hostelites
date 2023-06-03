import 'package:flutter/material.dart';
import 'package:hostelites/model/complaint_model.dart';
import 'package:hostelites/screens/input_complaint.dart';
import 'package:hostelites/widgets/tile.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  List<Complaint> complist = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Complaints')),
      ),
      body: ListView.builder(
        itemCount: complist.length,
        itemBuilder: (context, index) {
          return MyTile(
              uname: complist[index].username,
              year: complist[index].year,
              room: complist[index].room,
              block: complist[index].block,
              comp: complist[index].compl);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Card(
          child: InkWell(
            splashColor: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InputComplaint(
                          onNewComp: onNewComp,
                        )),
              );
            },
            child: const SizedBox(
              width: double.infinity,
              height: 100,
              child: Text('Report service issue'),
            ),
          ),
        ),
      ),
    );
  }

  void onNewComp(Complaint comp) {
    complist.add(comp);
    setState(() {});
  }
}
