import 'package:applicationmemoire/auth/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'input_field.dart';
import 'button.dart';

class InputWrapper extends StatelessWidget {
  const InputWrapper({Key? key}) : super(key: key);

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
              child: const InputFeild(),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "mot de passe oublié ?",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 40,
            ),
            const Button(),
            const SizedBox(height: 20,),

               Center(
                 child: RichText(
                  text:  TextSpan(
                    text: 'vous avez un compte ?  ',
                    style: const TextStyle(color: Colors.grey,),
                    children: [
                    TextSpan(
                      text: 'rejoignez-nous !',
                      style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      ),
                   recognizer:TapGestureRecognizer()..onTap=() {
                      Navigator.push(
                      context, MaterialPageRoute(builder: ((context) => const SignUP())));
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