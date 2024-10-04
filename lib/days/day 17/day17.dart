import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%2016/day_16.dart';
import 'package:flutter_challenge/utils/crudCard.dart';
import 'package:flutter_challenge/days/day%2017/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  final FirestoreServices firestoreServices = FirestoreServices();
  final TextEditingController textController = TextEditingController();

  // To handle opening a note box for create or update
  void openNoteBox({String? docID, String? initialText}) {
    if (initialText != null) {
      textController.text = initialText;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: InputDecoration(hintText: 'Enter your note'),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (docID == null) {
                firestoreServices.addNote(textController.text.trim());
              } else {
                firestoreServices.updateNote(docID, textController.text);
              }

              textController.clear();
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  // Delete a note from Firestore
  void deleteNoteBox(String docID) {
    firestoreServices.deleteNote(docID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('CRUD'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => context.go('/'), icon: Icon(Icons.arrow_back)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openNoteBox();
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreServices.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DocumentSnapshot> notesList = snapshot.data!.docs;
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = notesList[index];
                String docID = document.id;
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'];

                return CrudCard(
                  action: noteText,
                  icon: Icons.settings,
                  onEdit: () {
                    openNoteBox(docID: docID, initialText: noteText);
                  },
                  onDelete: () {
                    deleteNoteBox(docID);
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No notes available'));
          }
        },
      ),
    );
  }
}
