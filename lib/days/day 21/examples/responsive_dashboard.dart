import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResponsiveDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Dashboard'),
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            // Larger screens - Show a dashboard with multiple panels
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(color: Colors.blue, height: double.infinity),
                ),
                Expanded(
                  flex: 3,
                  child:
                      Container(color: Colors.green, height: double.infinity),
                ),
              ],
            );
          } else if (constraints.maxWidth > 500) {
            // Medium screens - Show a simplified dashboard
            return Column(
              children: [
                Container(color: Colors.blue, height: 200),
                Container(color: Colors.green, height: 300),
              ],
            );
          } else {
            // Smaller screens - Stack the items
            return ListView(
              children: [
                Container(color: Colors.blue, height: 200),
                Container(color: Colors.green, height: 300),
              ],
            );
          }
        },
      ),
    );
  }
}
