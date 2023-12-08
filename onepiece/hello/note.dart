/// main.dart: Entry point for your Flutter application.
/// home_screen.dart: Widget responsible for displaying the list of notes.
/// item_note.dart: Widget for displaying an individual note item in the list.
/// add_note_screen.dart: Widget for adding a new note.
/// notes_repository.dart: Class handling interactions with the SQLite database for notes.
/// note.dart: Class defining the structure of a note.

/// -------------------------------------- < : NOTE SECTION : > ------------------------------------------


// class Note{
//  int? id;
//  String title,description;
//  DateTime createdAt;
//  Note({
//    this.id,
//    required this.title,
//    required this.description,
//    required this.createdAt,
//   });
//
//   // Map<String, Object?> toMap() {}
//
//  Map<String, dynamic> toMap() {
//    return {
//      'title': title,
//      'description': description,
//      'createdAt': createdAt.toIso8601String(),
//    };
//  }
// }

// note.dart
// -----------------------------------------------------------------------------------------------------------------

class Note {
  int? id;
  String title, description;
  DateTime createdAt;

  Note({
    this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  Note copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? createdAt,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
