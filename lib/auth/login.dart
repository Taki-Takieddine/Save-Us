import 'package:applicationmemoire/auth/input_wrapper.dart';
import 'package:flutter/material.dart';
import 'Header.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
              Color.fromARGB(255, 217, 47, 247),
              Color.fromARGB(255, 53, 119, 174),
              Color.fromARGB(255, 109, 189, 112)
            ])),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            const Header(),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(60))),
              child: const InputWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}
