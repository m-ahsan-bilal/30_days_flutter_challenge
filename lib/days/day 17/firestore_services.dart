import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  // get collection from database
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  // create : add a new note
  Future<void> addNote(String note) async {
    try {
      await notes.add({'note': note, 'timestamp': Timestamp.now()});
      print('Note added successfully');
    } catch (e) {
      print('Error adding note: $e');
    }
  }

  // read : get notes from database
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

  // update : update notes given a doc ID
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      "note": newNote,
      "timestamp": Timestamp.now(),
    });
  }

  // delete : delete note given a doc id
  Future<void> deleteNote(String docId) {
    return notes.doc(docId).delete();
  }
}
