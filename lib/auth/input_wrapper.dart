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
          ],
        ),
      ),
    );
  }
}
