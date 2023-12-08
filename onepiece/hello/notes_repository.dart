// /// main.dart: Entry point for your Flutter application.
// /// home_screen.dart: Widget responsible for displaying the list of notes.
// /// item_note.dart: Widget for displaying an individual note item in the list.
// /// add_note_screen.dart: Widget for adding a new note.
// /// notes_repository.dart: Class handling interactions with the SQLite database for notes.
// /// note.dart: Class defining the structure of a note.
//
// /// -------------------------------------- < : NOTES REPOSITORY SECTION : > ------------------------------------------
//
//
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// import '../models/note.dart';
//
// class NotesRepository{
//   static const _dbName = 'notes_database.db';
//   static const _tableName = 'notes';
//
//   static Future<Database> _database() async {
//     final database = openDatabase (
//       join(await getDatabasesPath(),_dbName),
//       onCreate:(db,version){
//         return db.execute(
//           // 'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY,title TEXT ,description TEXT)',
//           'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, description TEXT, createdAt STRING)',
//         );
//       },
//       version: 13,
//     );
//     return database;
//   }
//   static insert({required Note note}) async {
//     final db = await _database();
//     await db.insert(
//       _tableName,
//       note.toMap(),
//       conflictAlgorithm:ConflictAlgorithm.replace,
//     );
//   }
//   static Future<List<Note>> getNotes() async{
//     final db = await _database();
//
//     // Query the table for all The Dogs.
//     final List<Map<String, dynamic>> maps = await db.query(_tableName);
//
//     // Convert the List<Map<String, dynamic> into a List<Dog>.
//     return List.generate(maps.length, (i) {
//       return Note(
//         id: maps[i]['id'] as int,
//         title: maps[i]['name'] as String,
//         description: maps[i]['description'] as String,
//         createdAt:DateTime.parse(maps[i]['createdAt'])
//       );
//     });
//   }
// }

// -----------------------------------------------------------------------------------------------------------------------

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/note.dart';

class NotesRepository {
  static const _dbName = 'notes_database.db';
  static const _tableName = 'notes';

  static Future<Database> _database() async {
    final database = openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, description TEXT, createdAt STRING)',
        );
      },
      version: 13,
    );
    return database;
  }

  static insert({required Note note}) async {
    final db = await _database();
    await db.insert(
      _tableName,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Note>> getNotes() async {
    final db = await _database();

    // Query the table for all the notes and order them by createdAt in descending order
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      orderBy: 'createdAt DESC', // Order by createdAt in descending order
    );

    // Convert the List<Map<String, dynamic> into a List<Note>.
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'] as int,
        title: maps[i]['title'] as String, // Correct field name 'title'
        description: maps[i]['description'] as String,
        createdAt: DateTime.parse(maps[i]['createdAt']),
      );
    });
  }

  static Future<void> delete(int id) async {
    final db = await _database();
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<void> update({required Note note}) async {
    final db = await _database();
    await db.update(
      _tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  static Future<Note> getNote(int id) async {
    final db = await _database();
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note(
        id: maps[0]['id'] as int,
        title: maps[0]['title'] as String,
        description: maps[0]['description'] as String,
        createdAt: DateTime.parse(maps[0]['createdAt']),
      );
    } else {
      throw Exception('Note not found');
    }
  }
}
