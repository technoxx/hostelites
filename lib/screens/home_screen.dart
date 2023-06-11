import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelites/drawer/edit_profile.dart';
import 'package:hostelites/drawer/settings.dart';
import 'package:hostelites/screens/feedback_screen.dart';
import 'package:hostelites/screens/input_complaint.dart';
import 'package:hostelites/utils/colors.dart';
import 'package:hostelites/widgets/userdata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(FirebaseAuth.instance.currentUser!.uid, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: mainColor,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: secondaryColor,
                    radius: 25,
                    child: Icon(
                      CupertinoIcons.person,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    userData['email'],
                    style: const TextStyle(
                      color: secondaryColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfile(
                            uid: FirebaseAuth.instance.currentUser!.uid,
                          )),
                );
              },
              child: const ListTile(
                leading: Icon(CupertinoIcons.person),
                title: Text(
                  'Edit Profile',
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MySettings()),
                );
              },
              child: const ListTile(
                leading: Icon(CupertinoIcons.settings_solid),
                title: Text('Settings'),
              ),
            ),
            const ListTile(
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
                  const Flexible(fit: FlexFit.tight, child: SizedBox()),
                  IconButton(
                    icon: const Icon(
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
