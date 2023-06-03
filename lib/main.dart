import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostelites/firebase_options.dart';
import 'package:hostelites/responsive/mobile_screen.dart';
import 'package:hostelites/responsive/responsive_screen.dart';
import 'package:hostelites/responsive/web_screen.dart';
import 'package:hostelites/screens/complaint_screen.dart';
import 'package:hostelites/screens/home_screen.dart';
import 'package:hostelites/screens/input_complaint.dart';
import 'package:hostelites/screens/login_screen.dart';
import 'package:hostelites/screens/register.dart';
import 'package:hostelites/utils/colors.dart';
import 'package:hostelites/widgets/tile.dart';

void main() async {
  //initialize flutter widgets
  WidgetsFlutterBinding.ensureInitialized();
  //initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hostelites',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: mainColor)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: mainColor)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: mainColor)),
        ),
      ),
      // home: const MyResponsiveLayout(
      //   webScreenLayout: webScreen(),
      //   mobileScreenLayout: mobileScreen(),
      // ),
      home: LoginScreen(),
    );
  }
}
