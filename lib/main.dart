import 'package:applicationmemoire/base_screen.dart';
import 'package:applicationmemoire/services/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'choose_profil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MyApp({Key? key, required this.prefs}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    prefs.clear();
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(
            create: (context) => FirebaseAuthService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'home',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder<AuthUser?>(
          stream: FirebaseAuthService().onAuthStateChanged,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final AuthUser? user = snapshot.data;
              if (user == null) {
                return const ChooseProfil(title: 'Flutter Demo Home Page');
              } else {
                return Provider.value(
                  value: user,
                  child: const BaseScreen(),
                );
              }
            }
            if (snapshot.hasError) {
              return Text('error ${snapshot.error}');
            }
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
