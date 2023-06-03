import 'package:flutter/material.dart';
import 'package:hostelites/model/complaint_model.dart';
import 'package:hostelites/utils/colors.dart';
import 'package:hostelites/widgets/text_field_input.dart';
import 'package:hostelites/widgets/tile.dart';
import 'package:hostelites/screens/complaint_screen.dart';

class InputComplaint extends StatefulWidget {
  const InputComplaint({super.key, required this.onNewComp});

  final Function(Complaint) onNewComp;

  @override
  State<InputComplaint> createState() => InputComplaintState();
}

class InputComplaintState extends State<InputComplaint> {
  final TextEditingController _compcontrol = TextEditingController();
  final TextEditingController _roomcontrol = TextEditingController();
  final TextEditingController _usernamecontrol = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _compcontrol.dispose();
    _roomcontrol.dispose();
    _usernamecontrol.dispose();
  }

  String dropdownvalue = 'Year';
  var items = ['Year', '1st year', '2nd year', '3rd year', '4th year'];

  String dropdown1value = 'Block';
  var items1 = ['Block', 'A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Complaints')),
      ),
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
              //Textfield for room no.
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
              //Textfield for complaint
              MyTextFieldInput(
                  isPass: false,
                  hinttext: 'Enter your Complaint',
                  control: _compcontrol,
                  batao: TextInputType.text),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  if (_usernamecontrol.text.isEmpty ||
                      _roomcontrol.text.isEmpty ||
                      dropdownvalue.isEmpty ||
                      dropdown1value.isEmpty ||
                      _compcontrol.text.isEmpty) {
                    return;
                  }
                  final com = Complaint(
                      username: _usernamecontrol.text,
                      year: dropdownvalue,
                      room: _roomcontrol.text,
                      block: dropdown1value,
                      compl: _compcontrol.text);
                  widget.onNewComp(com);
                  Navigator.of(context).pop();
                },
                //for done button
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: mainColor,
                  ),
                  child: const Text('Done'),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
