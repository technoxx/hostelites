import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelites/screens/home_screen.dart';
import 'package:hostelites/screens/navbar.dart';
import 'package:hostelites/utils/colors.dart';
import 'package:hostelites/widgets/text_field_input.dart';
import 'package:hostelites/resources/auth_methods.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailcontrol = TextEditingController();
  final TextEditingController _passcontrol = TextEditingController();
  final TextEditingController _roomcontrol = TextEditingController();
  final TextEditingController _usernamecontrol = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailcontrol.dispose();
    _passcontrol.dispose();
    _roomcontrol.dispose();
    _usernamecontrol.dispose();
  }

  void mySignUp() async {
    MyAuthMethods(FirebaseAuth.instance).mySignupUser(
        email: _emailcontrol.text,
        password: _passcontrol.text,
        username: _usernamecontrol.text,
        room: _roomcontrol.text,
        block: blockvalue,
        year: dropdownvalue,
        context: context);
  }

  String dropdownvalue = 'Select your Year';
  var items = [
    'Select your Year',
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year'
  ];

  String blockvalue = 'Select your Block';
  var block = ['Select your Block', 'A-Block', 'B-Block', 'C-Block'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text('Sign up'),
      )),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),
              //Textfield for username
              MyTextFieldInput(
                  isPass: false,
                  hinttext: 'Enter your Username',
                  control: _usernamecontrol,
                  batao: TextInputType.text),
              const SizedBox(
                height: 24,
              ),
              //Textfield for year
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: DropdownButtonFormField(
                    value: dropdownvalue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              //Textfield for room
              MyTextFieldInput(
                  isPass: false,
                  hinttext: 'Enter your Room No.',
                  control: _roomcontrol,
                  batao: TextInputType.text),
              const SizedBox(
                height: 24,
              ),
              //Textfield for block
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: DropdownButtonFormField(
                    value: blockvalue,
                    onChanged: (String? newValue1) {
                      setState(() {
                        blockvalue = newValue1!;
                      });
                    },
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: block.map((String block) {
                      return DropdownMenuItem(
                        value: block,
                        child: Text(block),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
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
              InkWell(
                onTap: () {
                  mySignUp();
                },
                //for register   button
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: mainColor,
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
