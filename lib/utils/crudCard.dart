import 'package:flutter/material.dart';

// Define the CrudCard as a reusable widget
class CrudCard extends StatelessWidget {
  final String action;
  final IconData icon;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CrudCard({
    Key? key,
    required this.action,
    required this.icon,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          action.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(icon),
              onPressed: onEdit, // For edit/update action
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete, // For delete action
            ),
          ],
        ),
      ),
    );
  }
}
