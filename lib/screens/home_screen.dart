import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelites/screens/feedback_screen.dart';
import 'package:hostelites/screens/input_complaint.dart';
import 'package:hostelites/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: mainColor,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: secondaryColor,
                    radius: 40,
                    child: Icon(
                      CupertinoIcons.person,
                      size: 40,
                    ),
                  ),
                  Text(
                    '   Your Profile',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.person),
              title: Text(
                'Edit Profile',
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.settings_solid),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.arrow_down_right),
              title: Text('Sign Out'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "Welcome Hostellers!",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: highlightColor,
                    ),
                  ),
                  Flexible(fit: FlexFit.tight, child: SizedBox()),
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.person_circle_fill,
                      size: 40,
                      color: secondaryColor,
                    ),
                    onPressed: () => _key.currentState!.openEndDrawer(),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/appfinalLogo.png',
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: highlightColor,
                  thickness: 5,
                  indent: 40,
                  endIndent: 40,
                ),
              ),
              Card(
                shadowColor: highlightColor,
                color: secondaryColor,
                child: InkWell(
                  splashColor: mainColor.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InputComplaint()),
                    );
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '  Report service issue',
                        style: TextStyle(
                            fontSize: 20,
                            color: mainColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                shadowColor: highlightColor,
                color: secondaryColor,
                child: InkWell(
                  splashColor: mainColor.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackScreen()),
                    );
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '  Give Feedback',
                        style: TextStyle(
                            fontSize: 20,
                            color: mainColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
