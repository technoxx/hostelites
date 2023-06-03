import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelites/resources/auth_methods.dart';
import 'package:hostelites/screens/home_screen.dart';
import 'package:hostelites/screens/register.dart';
import 'package:hostelites/utils/colors.dart';
import 'package:hostelites/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontrol = TextEditingController();
  final TextEditingController _passcontrol = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailcontrol.dispose();
    _passcontrol.dispose();
  }

  void myLoginUser() {
    MyAuthMethods(FirebaseAuth.instance).myLoginWithEmail(
        email: _emailcontrol.text,
        password: _passcontrol.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              Image.asset(
                'assets/images/abesLogo.png',
              ),
              const SizedBox(
                height: 64,
              ),
              //Textfield for email
              MyTextFieldInput(
                  isPass: false,
                  hinttext: 'Enter your Email',
                  control: _emailcontrol,
                  batao: TextInputType.emailAddress),
              const SizedBox(
                height: 24,
              ),
              //Textfield for password
              MyTextFieldInput(
                  isPass: true,
                  hinttext: 'Enter your Password',
                  control: _passcontrol,
                  batao: TextInputType.text),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: mainColor,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: secondaryColor,
                    radius: 30,
                    child: IconButton(
                      onPressed: () {
                        myLoginUser;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 30,
                        color: mainColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Don't have an account? "),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    //link for going to register page
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: mainColor),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
