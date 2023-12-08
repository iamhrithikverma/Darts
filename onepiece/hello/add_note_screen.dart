/// main.dart: Entry point for your Flutter application.
/// home_screen.dart: Widget responsible for displaying the list of notes.
/// item_note.dart: Widget for displaying an individual note item in the list.
/// add_note_screen.dart: Widget for adding a new note.
/// notes_repository.dart: Class handling interactions with the SQLite database for notes.
/// note.dart: Class defining the structure of a note.

/// -------------------------------------- < : ADD NOTE SCREEN SECTION : > ------------------------------------------

import 'package:flutter/material.dart';
import '../../models/note.dart';
import '../../repository/notes_repository.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _title = TextEditingController();
  final _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
        actions: [
          IconButton(
            onPressed: _insertNote,
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _title,
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: TextField(
                controller: _description,
                decoration: InputDecoration(
                  hintText: 'Start typing here..',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                maxLines: 50,
              ),
            ),
          ], // Children
        ),
      ),
    );
  }

  _insertNote() async {
    final note = Note(
      title: _title.text,
      description: _description.text,
      createdAt: DateTime.now(),
    );

    // Use a Future-based approach with a completion callback
    await NotesRepository.insert(note: note).then((_) {
      // The callback is executed after the asynchronous operation is completed
      Navigator.pop(context);
    });
  }
}


// _insertNote() async {
  //   final note = Note(
  //     title: _title.text,
  //     description: _description.text,
  //     createdAt: DateTime.now(),
  //   );
  //
  //   await NotesRepository.insert(note: note);
  //
  //   // Navigate back to HomeScreen after adding the note
  //   Navigator.pop(context);
  // }
// }
