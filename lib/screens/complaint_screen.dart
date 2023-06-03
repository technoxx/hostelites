import 'package:flutter/material.dart';
import 'package:hostelites/screens/input_complaint.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Complaints')),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Card(
            child: InkWell(
              splashColor: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputComplaint()),
                );
              },
              child: SizedBox(
                width: double.infinity,
                height: 100,
                child: Text('Report service issue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
