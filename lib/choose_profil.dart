

import 'package:applicationmemoire/screen/signaleur.dart';
import 'package:flutter/material.dart';

import 'package:applicationmemoire/auth/login.dart';
late final int type;
class ChooseProfil extends StatefulWidget {
  const ChooseProfil({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ChooseProfil> createState() => _ChooseProfilState();
}

class _ChooseProfilState extends State<ChooseProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                Colors.purple,
                Colors.blueAccent,
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               
              const BouttonProfil(
                icon: Icons.restaurant,title: 'Restaurant', type:1,
              ),
             
              const BouttonProfil(
                icon: Icons.directions_bike_rounded ,title: 'Livreur', type: 2,
              ),
               
               GestureDetector(
                          onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: ((context) => Signaleur())));
                     },
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent.withOpacity(0.15),
                    ),
                    height: 150,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [

                        Icon(
                 Icons.security_update_warning_outlined,
                        color: Colors.white,
                        size: 65,
                      ),
                      SizedBox(height: 5,),
                    Text("signaler",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
                      ],
                      
                    ),
                  ),
                ),
             
            ],
          ),
        ),
      ),
    );
  }
}
class BouttonProfil extends StatelessWidget {
  final IconData icon;
   final int type ;
  final String title;
  const BouttonProfil({Key? key, required this.icon, required this.title, required this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) =>  LogIn(title: '', type: type,))));
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.transparent.withOpacity(0.15),
        ),
        height: 150,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
            icon,
            color: Colors.white,
            size: 65,
          ),
          const SizedBox(height: 5,),
         Text( title ,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
          ],
           
        ),
      ),
    );
  }
}
