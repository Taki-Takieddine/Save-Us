import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'choose_profil.dart';


Future <void>main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'home',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: const ChooseProfil(title: 'Flutter Demo Home Page'),
    );
  }
}

