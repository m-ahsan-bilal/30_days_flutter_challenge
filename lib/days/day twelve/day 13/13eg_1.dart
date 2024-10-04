// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';

class Day13Eg extends StatefulWidget {
  @override
  _Day13EgState createState() => _Day13EgState();
}

class _Day13EgState extends State<Day13Eg> {
  double _width = 100;
  double _height = 100;
  double _top = 50;
  double _left = 50;
  bool _big = false;

  void _animateWidget() {
    setState(() {
      _big = !_big;
      _width = _big ? 200 : 100;
      _height = _big ? 200 : 100;
      _top = _big ? 200 : 50;
      _left = _big ? 200 : 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Example 1'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
      ),
      // title: Text('Animate Widget Position & Size'),

      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            top: _top,
            left: _left,
            child: AnimatedContainer(
              width: _width,
              height: _height,
              duration: Duration(seconds: 1),
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Animate Me',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateWidget,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
