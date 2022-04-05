import 'package:flutter/material.dart';

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
      
      body:SafeArea(
      child: Container(
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height ,
              decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Color.fromARGB(255, 217, 47, 247), Color.fromARGB(255, 53, 119, 174),Color.fromARGB(255, 109, 189, 112)])),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    boutton_profil(const Icon(Icons.favorite,color: Colors.white,size: 65,)),
                    boutton_profil(const Icon(Icons.call,color: Colors.white,size: 65),),
                    boutton_profil(const Icon(Icons.access_alarm,color: Colors.white,size: 65)),
                    
                    ],),
      ),
    ),);
  }
}

class boutton_profil extends StatelessWidget {
  final Icon icon;
  boutton_profil(this.icon);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(10.0) ,
       color: Colors.transparent.withOpacity(0.15),
      ),
      height: 150,
      width: 150,
      child: icon,
      
      ),
    );
  }
}
