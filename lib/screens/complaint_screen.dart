import 'package:flutter/material.dart';

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
        children: [
          Card(
            child: InkWell(
              splashColor: Colors.blue,
              onTap: () {},
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
