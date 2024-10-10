import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResponsiveProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Profile Page'),
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Check if the width is greater than 600px (e.g., tablet or desktop)
          if (constraints.maxWidth > 600) {
            return _buildWideLayout(context);
          } else {
            return _buildNarrowLayout(context);
          }
        },
      ),
    );
  }

  // Layout for smaller screens (mobile)
  Widget _buildNarrowLayout(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ),
          Text(
            'John Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Flutter Developer',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Passionate developer with 3 years of experience building mobile applications using Flutter. Skilled in writing clean and maintainable code.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  // Layout for larger screens (tablet or desktop)
  Widget _buildWideLayout(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: CircleAvatar(
              radius: 120,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Flutter Developer',
                  style: TextStyle(fontSize: 24, color: Colors.grey),
                ),
                SizedBox(height: 20),
                Text(
                  'Passionate developer with 3 years of experience building mobile applications using Flutter. Skilled in writing clean and maintainable code.',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
