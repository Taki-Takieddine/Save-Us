import 'package:applicationmemoire/screen/signaleur.dart';
import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
           MaterialPageRoute(builder: ((context) => const Signaleur())));
      },
     child: 
    Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(

        child: Text("Log In",style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          ),),
      ),
    )
    );
  }
}