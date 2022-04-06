import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
   return  Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: const <Widget>[
          Center(
            child: Text("Log In",style: TextStyle(
              color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold ),),
          ),
        SizedBox(height: 40,),
        Center(
        child: Text("un petit slogant dok nkhmem fih ",style: TextStyle(
          color: Colors.white,fontSize: 18
        ),),
        )
        ],
      ),
    );
  }
  
}