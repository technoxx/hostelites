import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelites/screens/complaint_screen.dart';
import 'package:hostelites/screens/feedback_screen.dart';
import 'package:hostelites/screens/home_screen.dart';
import 'package:hostelites/screens/mess_screen.dart';
import 'package:hostelites/screens/room.dart';
import 'package:hostelites/utils/colors.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int myIndex = 0;
  final screenList = [
    HomeScreen(),
    AvailableRooms(),
    ComplaintScreen(),
    MessMenu(),
    FeedbackScreen()
  ];
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
          unselectedItemColor: mainColor,
          selectedItemColor: secondaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.bed_double,
                size: 30,
              ),
              label: 'Rooms',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.news,
                size: 30,
              ),
              label: 'Complaints',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.book,
                size: 30,
              ),
              label: 'Mess menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.create,
                size: 30,
              ),
              label: 'Feedback',
            ),
          ]),
    );
  }
}
