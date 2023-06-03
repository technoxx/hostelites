import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelites/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Welcome Hostellers!",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: secondaryColor,
                ),
              ),
              Flexible(fit: FlexFit.tight, child: SizedBox()),
              Icon(
                CupertinoIcons.person_circle_fill,
                size: 40,
                color: secondaryColor,
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
