import 'package:flutter/material.dart';


class Signaleur extends StatelessWidget {
  const Signaleur({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signaleur") ,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {},
          child: Icon(Icons.pin_drop_outlined),


      ),
    );
  } 
}