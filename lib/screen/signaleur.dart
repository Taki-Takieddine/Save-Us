import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Signaleur extends StatelessWidget {
  const Signaleur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signaleur"),
      ),
      body:const GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(35.69111, -0.64167)),)
      // Center(
       // child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        //  children: const <Widget>[],
      //  ),
    //  ),
      //floatingActionButton: FloatingActionButton(
        //onPressed: () {},
        //child: const Icon(Icons.pin_drop_outlined),
      //),
    );
  }
}
