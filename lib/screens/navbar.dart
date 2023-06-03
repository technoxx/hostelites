import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelites/screens/complaint_screen.dart';
import 'package:hostelites/screens/feedback_screen.dart';
import 'package:hostelites/screens/home_screen.dart';
import 'package:hostelites/utils/colors.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int myIndex = 0;
  final screenList = [HomeScreen(), ComplaintScreen(), FeedbackScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[myIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: myIndex,
          onTap: (index) {
            setState(() {});
            myIndex = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: 'Complaints',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feedback),
              label: 'Feedback',
            ),
          ]),
    );
  }
}
