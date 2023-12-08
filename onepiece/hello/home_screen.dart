// /// main.dart: Entry point for your Flutter application.
// /// home_screen.dart: Widget responsible for displaying the list of notes.
// /// item_note.dart: Widget for displaying an individual note item in the list.
// /// add_note_screen.dart: Widget for adding a new note.
// /// notes_repository.dart: Class handling interactions with the SQLite database for notes.
// /// note.dart: Class defining the structure of a note.
//
// /// -------------------------------------- < : HOME SCREEN SECTION : > ------------------------------------------
//
// import 'package:diary/screens/home/widgets/item_note.dart';
// import 'package:flutter/material.dart';
// import '../../repository/notes_repository.dart';
// import '../add-note/add_note_screen.dart';
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//   class _HomeScreenState extends State<HomeScreen> {
//     @override
//     Widget build(BuildContext context){
//         return Scaffold(
//           appBar : AppBar(
//             title:const Text('My Diary'),
//             centerTitle: true,
//           ),
//           body:
//           FutureBuilder(
//             future: NotesRepository.getNotes(),
//             builder: (context,snapshot){
//               // if(snapshot.connectionState == ConnectionState.done){
//               if(snapshot.data != null && snapshot.data!.isEmpty) {
//                 if(snapshot.hasData && snapshot.data!.isEmpty) {
//                   return const Center(child: Text("Empty"));
//                 }
//                 return ListView(
//                   padding: const EdgeInsets.all(15),
//                   children: [
//                     for(var note in snapshot.data!)
//                       ItemNote(note: note)
//                   ]
//                 );
//               }
//               return const SizedBox();
//             },
//           ),
//       // ListView(
//           //   padding: const EdgeInsets.all(5),
//           //   children:const [
//           //     ItemNote(),
//           //     ItemNote(),
//           //     ItemNote(),
//           //     ItemNote(),
//           //     ItemNote(),
//           //     ItemNote(),
//           //     ItemNote(),
//           //     ItemNote(),
//           //     ItemNote(),
//           //     ItemNote(),
//           //     ItemNote(),
//           //     ItemNote(),
//           //     ItemNote(),
//           //   ],
//           // ),
//           floatingActionButton:FloatingActionButton(
//             onPressed:(){
//               Navigator.push(context,MaterialPageRoute(builder : (_)=> const AddNoteScreen()));
//             },
//             backgroundColor:Theme.of(context).colorScheme.primary,
//             foregroundColor:Colors.white,
//             child:const Icon(Icons.add)
//           )
//         );
//     }
//   }

// home_screen.dart

// ------------------------------------------------------------------------------------------------------------------------------------------

import 'package:flutter/material.dart';
import '../../models/note.dart';
import '../../repository/notes_repository.dart';
import '../add-note/add_note_screen.dart';
import '../edit_note/edit_note_screen.dart';
import 'widgets/item_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // get note => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('My Diary'),
      //   centerTitle: true,
      // ),
      appBar: AppBar(
        title: const Text('My Diary'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddNoteScreen()),
              );

              // Use setState to trigger a rebuild when navigating back from AddNoteScreen
              setState(() {});
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder<List<Note>>(
        future: NotesRepository.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null && snapshot.data!.isEmpty) {
              return const Center(child: Text("Empty"));
            }
            return ListView(
              padding: const EdgeInsets.all(15),
              children: [
                for (var note in snapshot.data!)
                  ItemNote(
                    note: note,
                    onDelete: () {
                      if (note.id != null) {
                        int nonNullableId = note.id!;
                        _showDeleteConfirmationDialog(nonNullableId);
                      }
                    },
                    onEdit: () {
                      if (note.id != null) {
                        int nonNullableId = note.id!;
                        _navigateToEditNoteScreen(nonNullableId);
                      }
                    },
                  ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (_) => const AddNoteScreen()),
      //     );
      //
      //     // Use setState to trigger a rebuild when navigating back from AddNoteScreen
      //     setState(() {});
      //   },
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   foregroundColor: Colors.white,
      //   child: const Icon(Icons.add),
      // ),
    );
  }


  void _showDeleteConfirmationDialog(int noteId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Note"),
          content: const Text("Are you sure you want to delete this note?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Delete the note and refresh the UI
                _deleteNoteAndRefresh(noteId);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
    // For example, you can use showDialog
  }
  // Delete the note and refresh the UI
  void _deleteNoteAndRefresh(int noteId) async {
    await NotesRepository.delete(noteId);
    setState(() {});
  }


  void _navigateToEditNoteScreen(int noteId) async {
    // Implement your navigation to EditNoteScreen here
    // For example, you can use Navigator.push
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditNoteScreen(noteId: noteId),
      ),
    );

    // Check if the result is not null and is of type Note
    if (result != null && result is Note) {
      // Refresh the UI with the updated note
      setState(() {});
    }
  }
  }
