import 'package:applicationmemoire/auth/login.dart';

import 'package:applicationmemoire/auth/widget_sign_up/button_signup.dart';
import 'package:applicationmemoire/auth/widget_sign_up/input_field_su.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';



class InputWrappersu extends StatelessWidget {
  const InputWrappersu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
               child: const InputFeildsu(),
            ),
            const SizedBox(
              height: 40,
            ),
            
            const SizedBox(
              height: 40,
            ),
            const ButtonSignUp(),
            const SizedBox(height: 20,),

               Center(
                 child: RichText(
                  text:  TextSpan(
                    text: 'vous avez un compte ?  ',
                    style: const TextStyle(color: Colors.grey,),
                    children: [
                    TextSpan(
                      text: 'connectez-vous !',
                      style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      ),
                   recognizer:TapGestureRecognizer()..onTap=() {
                      Navigator.push(
                      context, MaterialPageRoute(builder: ((context) => const LogIn(title: '',))));
                   }
                    )
                    ],
                  ),
                           ),
               ),
          
          ],
        ),
      ),
    );
  }
  }