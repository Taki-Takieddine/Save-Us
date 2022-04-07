import 'package:flutter/material.dart';

class HeaderSU extends StatelessWidget {
  const HeaderSU({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
   return  Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: const <Widget>[
          Center(
            child: Text("Sign Up",style: TextStyle(
              color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold ),),
          ),
        SizedBox(height: 40,),
        Center(
        child: Text("un petit slogant dok nkhmem fih tani ",style: TextStyle(
          color: Colors.white,fontSize: 18
        ),),
        )
        ],
      ),
    );
  }
  
}