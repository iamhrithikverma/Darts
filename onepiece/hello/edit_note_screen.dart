import 'package:flutter/material.dart';
import '../../models/note.dart';
import '../../repository/notes_repository.dart';

class EditNoteScreen extends StatefulWidget {
  final int noteId;

  const EditNoteScreen({Key? key, required this.noteId}) : super(key: key);

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late Note note;

  @override
  void initState() {
    super.initState();
    _loadNoteData();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  _loadNoteData() async {
    // Use the correct method from NotesRepository to get the note by ID
    note = await NotesRepository.getNote(widget.noteId);

    // Initialize controllers with the loaded note data
    _titleController.text = note.title;
    _descriptionController.text = note.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        actions: [
          IconButton(
            onPressed: _updateNote,
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
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
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: 'Start typing here..',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                maxLines: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _updateNote() async {
    // Update the note object with the new data
    note = note.copyWith(
      title: _titleController.text,
      description: _descriptionController.text,
    );

    // Use NotesRepository to update the note in the database
    await NotesRepository.update(note: note);

    // Pass the updated note back to the previous screen
    Navigator.pop(context, note);
  }
}
