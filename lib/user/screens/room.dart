import 'package:flutter/material.dart';
import 'package:hostelites/user/available_rooms.dart/a.dart';
import 'package:hostelites/user/available_rooms.dart/b.dart';
import 'package:hostelites/user/available_rooms.dart/c.dart';
import 'package:hostelites/utils/colors.dart';

class AvailableRooms extends StatelessWidget {
  const AvailableRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text('Available Rooms'),
        ),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ABlock()),
                  );
                },
                child: const SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '  A-Block',
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
                    MaterialPageRoute(builder: (context) => BBlock()),
                  );
                },
                child: const SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '  B-Block',
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
                    MaterialPageRoute(builder: (context) => CBlock()),
                  );
                },
                child: const SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '  C-Block',
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
