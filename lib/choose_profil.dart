

import 'package:flutter/material.dart';

import 'package:applicationmemoire/auth/login.dart';

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
            children:const [
               
              BouttonProfil(
                icon: Icons.restaurant,title: 'Restaurant',
              ),
             
              BouttonProfil(
                icon: Icons.directions_bike_rounded ,title: 'Livreur'
              ),
              
              BouttonProfil(
                icon: Icons.security_update_warning_outlined,title: 'Signaler'
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
  final String title;
  const BouttonProfil({Key? key, required this.icon, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => const LogIn(title: '',))));
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
