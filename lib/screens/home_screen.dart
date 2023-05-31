import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 150,
            child: Text(
              "Welcome back Aliens!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: 'Complaints',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
      ]),
    );
  }
}
