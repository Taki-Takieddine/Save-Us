

import 'package:applicationmemoire/choose_profil.dart';
import 'package:applicationmemoire/screen/signaleur.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
class NavBar extends StatefulWidget {
  const NavBar({ Key? key }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

 
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: Drawer(
        backgroundColor: const Color.fromARGB(255, 53, 119, 174),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.stretch,
            children:< Widget >[
              buildHeader(context),
              Builder(
                builder: (context) {
                  return buildMenuItems(context);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

 Widget buildMenuItems(BuildContext context)=>Container(
   
   padding: const EdgeInsets.all(30),
  
   child: Wrap(
     runSpacing: 15,
 children: [
   
    ListTile(
      leading: const Icon(Icons.home_outlined,color: Colors.white,),
      title: const Text('Home',style: TextStyle(color: Colors.white,fontSize: 16),),
      onTap: (){
        Navigator.push(
                      context, MaterialPageRoute(builder: ((context) =>const ChooseProfil(title: '',))));
      },
 
    ),
    const Divider(color: Colors.white ,),
    ListTile(
      leading: const Icon(Icons.security_update_warning_outlined,color: Colors.white,),
      title: const Text('Signaler',style: TextStyle(color: Colors.white,fontSize: 16),),
      onTap: (){
         Navigator.push(
                      context, MaterialPageRoute(builder: ((context) =>const Signaleur())));
      },
 
    ),
   const Divider(color: Colors.white ,),
    ListTile(
      leading: const Icon(Icons.logout,color: Colors.white,),
      title: const Text('Déconnexion',style: TextStyle(color: Colors.white,fontSize: 16),),
      onTap: (){
        showSpinner(context);
        FirebaseAuth.instance.signOut().then((value) => 
        Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: ((context) => const ChooseProfil(title: '',))))
        );
         
      },
    )
 ],
   ),
 );

 Widget buildHeader(BuildContext context) =>Container(
   
   padding: EdgeInsets.only(
     top:30+ MediaQuery.of(context).padding.top,
     bottom: 30,
   ),
   child: Column(
     children:  [
       const CircleAvatar(
         backgroundColor: Colors.transparent,
         radius: 70,
          child: Icon(Icons.account_circle,size: 120,color: Colors.white,),
       ),
       const SizedBox(height: 15,),
       Text((FirebaseAuth.instance.currentUser!.email).toString(),style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
       const SizedBox(height: 15,),
     ],
   ),
 );
 showSpinner(BuildContext context){
    final progress = ProgressHUD.of(context);
                                  progress?.showWithText('Chargement...');
                                  Future.delayed(const Duration(seconds: 2), () {
                                   progress?.dismiss();
                                  });
  }
}