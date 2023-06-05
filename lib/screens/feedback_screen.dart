import 'package:flutter/material.dart';
import 'package:hostelites/utils/colors.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Feedback')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              shadowColor: highlightColor,
              color: secondaryColor,
              child: InkWell(
                splashColor: mainColor.withAlpha(30),
                onTap: () {},
                child: const SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '  Hostel Basic Facilities',
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
                onTap: () {},
                child: const SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '  Mess',
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
                onTap: () {},
                child: const SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '  Warden',
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
    );
  }
}
