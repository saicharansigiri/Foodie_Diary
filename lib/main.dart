import 'package:flutter/material.dart';
import 'package:foodie/home_page/home.dart';
import 'package:foodie/screens/mynotes.dart';
import 'package:foodie/screens/photos.dart';
import 'package:foodie/screens/quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => MyHomepage(),
        '/myquiz':(context) => MyQuizPage(),
        '/addphotos':(context)=>MyPhotos(),
        '/mynotes':(context)=>MyNotes(),
      },
    );
  }
}

