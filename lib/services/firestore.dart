import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  Future addNote(String note,String fecha) async {
    return notes.add({
      'nota': note,
      'fecha': fecha,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getNotes() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
    
  }

  Future<void> updateNote(String docID, String newNote,String fecha) async {
    return notes.doc(docID).update({
      'nota': newNote,
      'timestamp': Timestamp.now(),
      'fecha':fecha
    });
  }

  Future<void> deleteNote(String docID) async {
    return notes.doc(docID).delete();
  }
}
