import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:note_app/View/addNote.dart';
import 'package:note_app/View/splashScreen.dart';
import 'firebase_options.dart';

void main() async {
// ...
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.deepPurple, primarySwatch: Colors.deepPurple),
      home: const SplashScreen(),
    );
  }
}
