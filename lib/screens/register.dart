import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
        year: dropdownvalue,
        context: context);
  }

  String dropdownvalue = '';
  var items = ['', '1st year', '2nd year', '3rd year', '4th year'];

  String dropdown1value = '';
  var items1 = ['', 'A', 'B', 'C'];

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
                height: 24,
              ),
              //Textfield for username
              MyTextFieldInput(
                  isPass: false,
                  hinttext: 'Enter your username',
                  control: _usernamecontrol,
                  batao: TextInputType.text),
              const SizedBox(
                height: 24,
              ),
              //Textfield for year
              TextField(
                decoration: InputDecoration(
                  labelText: 'Select an item',
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
                  hinttext: 'Enter your room no.',
                  control: _roomcontrol,
                  batao: TextInputType.text),
              const SizedBox(
                height: 24,
              ),
              //Textfield for block
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter your Block',
                  border: OutlineInputBorder(),
                  suffixIcon: DropdownButtonFormField(
                    value: dropdown1value,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdown1value = newValue1!;
                      });
                    },
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items1.map((String items1) {
                      return DropdownMenuItem(
                        value: items1,
                        child: Text(items1),
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
                onTap: mySignUp,
                //for register   button
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: mainColor,
                  ),
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
