import 'package:flutter/material.dart';

 class InputFeild extends StatelessWidget{
  const InputFeild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Column(
     children: <Widget>[
        Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey,
        )
      )
    ),
    child: const TextField(
      decoration: InputDecoration(
        hintText: "name@gmail.com",
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none
      ),
    ),
   ),
    Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey,
        )
      )
    ),
    child: const TextField(
      decoration: InputDecoration(
        hintText: "mot de passe",
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none
      ),
    ),
   )
     ],
   );
  }
  
}