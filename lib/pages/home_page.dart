// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_workshop_progra/services/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreService firestoreService = FirestoreService();

  final textController1 = TextEditingController();
  final textController2 = TextEditingController();

  void openNoteBox(String? docID) {
    showDialog(
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AlertDialog(
                title: Text('Añadir Recordatorio'),
                content: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Tarea'),
                      controller: textController1,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Fecha'),
                      controller: textController2,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancelar')),
                  TextButton(
                      onPressed: () {
                        if (docID == null) {
                          firestoreService.addNote(
                              textController1.text, textController2.text);
                          Navigator.pop(context);
                        } else {
                          firestoreService.updateNote(docID,
                              textController1.text, textController2.text);
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Añadir')),
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Recordatorios'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openNoteBox(null);
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: firestoreService.getNotes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List notesList = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: notesList.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = notesList[index];
                    String docID = document.id;

                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    String noteText = data['nota'];
                    String fechaMaxima = data['fecha'].toString();

                    return ListTile(
                        dense: true,
                        tileColor: Colors.blue[200],
                        leading: Icon(Icons.notification_important_rounded),
                        subtitle: Text(fechaMaxima),
                        title: Text(noteText),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  openNoteBox(docID);
                                },
                                icon: Icon(Icons.settings)),
                            IconButton(
                                onPressed: () {
                                  firestoreService.deleteNote(docID);
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        ));
                  });
            } else {
              if (snapshot.hasData == false) {
              return  Text('No hay Recordatorios');
            }
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
