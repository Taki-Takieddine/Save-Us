import 'package:flutter/material.dart';


class Livreur extends StatelessWidget {
  const Livreur({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Livreur") ,
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {},
          child: Icon(Icons.pin_drop_outlined),


      ),
    );
  } 
}