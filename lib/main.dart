import 'package:animated_splash_screen/animated_splash_screen.dart';
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
import 'package:page_transition/page_transition.dart';

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
        appBarTheme: AppBarTheme(backgroundColor: mainColor),
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 2, color: mainColor)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 2, color: mainColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 2, color: mainColor)),
        ),
      ),
      // home: const MyResponsiveLayout(
      //   webScreenLayout: webScreen(),
      //   mobileScreenLayout: mobileScreen(),
      // ),
      home: AnimatedSplashScreen(
        splash: Center(
            child: Container(
          child: Image.asset(
            'assets/images/appfinalLogo.png',
            height: 150,
          ),
        )),
        nextScreen: LoginScreen(),
        duration: 1500,
        splashTransition: SplashTransition.slideTransition,
        backgroundColor: secondaryColor,
      ),
    );
  }
}
