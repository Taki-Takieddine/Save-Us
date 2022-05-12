
import 'package:flutter/material.dart';
import 'navbar.dart';

late final int type;
class Admin extends StatefulWidget {
   const Admin({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<Admin> createState() => _AdminState();
}


class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  const NavBar(),
      appBar: AppBar(
        title: const Center(child: Text('Livreur')),
        backgroundColor: Colors.purple,
        
        
      ),
      
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
                Colors.blueAccent, ]
                   )
                  ),
                  child: const Center(child: Text('hi admin'),))));
                    
                      
 }
}