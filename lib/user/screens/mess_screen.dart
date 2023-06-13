import 'package:flutter/material.dart';

class MessMenu extends StatefulWidget {
  const MessMenu({super.key});

  @override
  State<MessMenu> createState() => _MessMenuState();
}

class _MessMenuState extends State<MessMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Center(child: Text('Mess Menu')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/images/Document 16_1.jpg'),
      ),
    );
  }
}
