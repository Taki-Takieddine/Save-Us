import 'package:flutter/material.dart';

import 'choose_profil.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'home',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: const ChooseProfil(title: 'Flutter Demo Home Page'),
    );
  }
}

