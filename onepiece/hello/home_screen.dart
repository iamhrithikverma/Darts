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

import 'package:flutter/material.dart';
import '../../models/note.dart';
import '../../repository/notes_repository.dart';
import '../add-note/add_note_screen.dart';
import 'widgets/item_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Diary'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Note>>(
        future: NotesRepository.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.data != null && snapshot.data!.isEmpty) {
            if (snapshot.hasData && snapshot.data!.isEmpty) {
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
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddNoteScreen()),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDeleteConfirmationDialog(int noteId) {
    // Implement your delete confirmation dialog here
    // For example, you can use showDialog
  }

  void _navigateToEditNoteScreen(int noteId) {
    // Implement your navigation to EditNoteScreen here
    // For example, you can use Navigator.push
  }
}
