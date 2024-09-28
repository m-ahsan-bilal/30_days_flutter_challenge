import 'package:flutter/material.dart';
import 'package:flutter_challenge/utils/my_text_field.dart';
import 'package:go_router/go_router.dart';

class DaySeven extends StatefulWidget {
  const DaySeven({super.key});

  @override
  State<DaySeven> createState() => _DaySevenState();
}

class _DaySevenState extends State<DaySeven> {
  final saveController = TextEditingController();
  final saveFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.go('/');
              },
              icon: const Icon(Icons.arrow_back))
        ],
        title: Text(
          'Day 7',
          style: TextStyle(color: Colors.lightGreen.shade400),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.save,
            size: 150,
          ),
          MyTextField(
              controller: saveController,
              hintText: " Save Data",
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Something To Save';
                }
                return null;
              },
              focusNode: saveFocus),
        ],
      ),
    );
  }
}
