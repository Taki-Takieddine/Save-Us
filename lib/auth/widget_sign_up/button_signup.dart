import 'package:applicationmemoire/auth/sign_up.dart';

import 'package:flutter/material.dart';


class ButtonSignUp extends StatelessWidget {
  const ButtonSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
           MaterialPageRoute(builder: ((context) => const SignUP())));
      },
     child: 
    Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      
      ),
      child: const Center(

        child: Text("Sign Up",style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          ),),
      ),
    )
    );
  }
}