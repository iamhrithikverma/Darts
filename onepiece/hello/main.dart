/// main.dart: Entry point for your Flutter application.
/// home_screen.dart: Widget responsible for displaying the list of notes.
/// item_note.dart: Widget for displaying an individual note item in the list.
/// add_note_screen.dart: Widget for adding a new note.
/// notes_repository.dart: Class handling interactions with the SQLite database for notes.
/// note.dart: Class defining the structure of a note.

/// -------------------------------------- < : MAIN SECTION : > ------------------------------------------

/// main.dart: Entry point for your Flutter application.
/// home_screen.dart: Widget responsible for displaying the list of notes.
/// item_note.dart: Widget for displaying an individual note item in the list.
/// add_note_screen.dart: Widget for adding a new note.
/// notes_repository.dart: Class handling interactions with the SQLite database for notes.
/// note.dart: Class defining the structure of a note.

/// -------------------------------------- < : MAIN SECTION : > ------------------------------------------
import 'package:diary/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

/// main.dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    InheritedThemeNotifier(
      notifier: ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diary',
      themeMode: ThemeNotifier.of(context)?.themeMode ?? ThemeMode.system,
      theme: ThemeData.light(), // Set the default light theme
      darkTheme: ThemeData.dark(), // Set the default dark theme
      home: const HomeScreen(),
    );
  }
}
