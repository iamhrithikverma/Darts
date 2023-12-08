/// main.dart: Entry point for your Flutter application.
/// home_screen.dart: Widget responsible for displaying the list of notes.
/// item_note.dart: Widget for displaying an individual note item in the list.
/// add_note_screen.dart: Widget for adding a new note.
/// notes_repository.dart: Class handling interactions with the SQLite database for notes.
/// note.dart: Class defining the structure of a note.

/// -------------------------------------- < : ITEM NOTE SECTION : > ------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// import '../../../models/note.dart';
//
// class ItemNote extends StatelessWidget {
//  final Note note;
//   const ItemNote({super.key, required this.note});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin:const EdgeInsets.symmetric(vertical:10),
//       child: Row(
//         children:[
//           Container(
//             padding:const EdgeInsets.symmetric(horizontal:15,vertical:5),
//             decoration:BoxDecoration(
//               borderRadius:BorderRadius.circular(10),
//               color:Colors.red,
//             ),
//             child:Column(
//               children:[
//                 Text(DateFormat(DateFormat.ABBR_MONTH).format(note.createdAt),
//                 style:const TextStyle(color:Colors.white70),
//                 ),
//                 const SizedBox(height:3),
//                 Text(DateFormat(DateFormat.DAY).format(note.createdAt),
//                   style:Theme.of(context).textTheme.titleLarge?.copyWith(
//                   color:Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height:3),
//                 Text(note.createdAt.year.toString(),
//                   style: const TextStyle(color:Colors.white70),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width:15),
//           Expanded(
//             child:Column(
//               crossAxisAlignment:CrossAxisAlignment.start,
//               children:[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children:[
//                     Expanded(
//                       child: Text(note.title,
//                         style: const TextStyle(fontWeight:FontWeight.bold),
//                         maxLines:1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//
//                     ),
//                     Text(
//                       DateFormat(DateFormat.HOUR_MINUTE).format(note.createdAt),
//                     ),
//                   ],
//                 ),
//                 Text(note.description,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w300,
//                   height:1.5,
//                 ),
//                   maxLines:3,
//                   overflow:TextOverflow.ellipsis,
//                 ),
//               ]
//             )
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:diary/models/note.dart';

class ItemNote extends StatelessWidget {
  final Note note;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const ItemNote({
    Key? key,
    required this.note,
    this.onDelete,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            child: Column(
              children: [
                Text(
                  DateFormat(DateFormat.ABBR_MONTH).format(note.createdAt),
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 3),
                Text(
                  DateFormat(DateFormat.DAY).format(note.createdAt),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        note.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      DateFormat(DateFormat.HOUR_MINUTE).format(note.createdAt),
                    ),
                  ],
                ),
                Text(
                  note.description,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    height: 1.5,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: onEdit != null
                          ? () {
                        onEdit!();
                      }
                          : null,
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: onDelete != null
                          ? () {
                        onDelete!();
                      }
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
