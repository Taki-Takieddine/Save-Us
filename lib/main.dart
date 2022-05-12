import 'package:applicationmemoire/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'choose_profil.dart';


Future <void>main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Obtain shared preferences.
final prefs = await SharedPreferences.getInstance();
prefs.clear();
  runApp( MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
 final SharedPreferences prefs;
  const MyApp({Key? key, required this.prefs}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    prefs.clear();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'home',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
     home: const ChooseProfil(title: 'Flutter Demo Home Page'),
  //  home:    StreamBuilder(
  //         stream: AuthData().onAuthStateChanged,
  //         builder: (context, snapshot)  {
  //           if (snapshot.connectionState == ConnectionState.active) {
  //             final user = snapshot.data;
  //             if (user == null) {
  //                  return const ChooseProfil(title: 'Flutter Demo Home Page');
  //             } else {
                                             
  //      //  final typeUser =  dh(prefs.getString('idUser')!);
  //      final typeUser = 'iYSEDSiozwhyp5JP1Z2J7DiOhHs2';
  //            if (typeUser == 1) {
  //                                    return   const Restaurent(title: 'resto');
  //                                     }
  //                                     if (typeUser == 2) {
  //                                     return
  //                                                    const Livreur(title: '',);
  //                                     }
                    
  //             }
  //           }
  //           if(snapshot.hasError){
  //             return Text('error ${snapshot.error}');
  //           }
  //             return const Scaffold(
  //               body: Center(
  //                 child: CircularProgressIndicator(),
  //               ),
  //             );
            
           
  //         },
  //       ),
    );
  }
}
Future dh(String userId)async{
           final typeUser =
                                          await AuthData().getTypeUser(userId);
                                    return typeUser;
                                    }


