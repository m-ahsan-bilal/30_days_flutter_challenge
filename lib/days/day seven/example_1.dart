import 'package:flutter/material.dart';
import 'package:flutter_challenge/utils/my_button.dart';
import 'package:flutter_challenge/utils/my_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Example1 extends StatefulWidget {
  const Example1({super.key});

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  final saveController = TextEditingController();
  final saveFocus = FocusNode();
  final KEYNAME = "saveData";
  var saveValue = "No any saved Data";
  @override
  void initState() {
    super.initState();
    getSavedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.go('/day_seven');
              },
              icon: const Icon(Icons.arrow_back))
        ],
        title: Text(
          'Exapmle 1',
          style: TextStyle(
              color: Colors.lightGreenAccent.shade400,
              fontSize: 18,
              fontWeight: FontWeight.bold),
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
              hintText: "Enter Something To Save",
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  print('Please Enter Something To Save');
                }
                return null;
              },
              focusNode: saveFocus),
          const SizedBox(
            height: 30,
          ),
          MyButton(
            title: " Save",
            onTap: () async {
              final save = saveController.text.toString();
              var prefs = await SharedPreferences.getInstance();

              prefs.setString(KEYNAME, save);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Text(saveValue),
        ],
      ),
    );
  }

  void getSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    var getData = prefs.getString(KEYNAME);
    saveValue = getData ?? "No Saved Data";
    setState(() {});
  }
}
