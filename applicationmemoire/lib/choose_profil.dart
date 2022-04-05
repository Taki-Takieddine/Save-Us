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
        decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Color.fromARGB(255, 217, 47, 247), Color.fromARGB(255, 53, 119, 174),Color.fromARGB(255, 109, 189, 112)])),
                
      ),
    ),);
  }
}
