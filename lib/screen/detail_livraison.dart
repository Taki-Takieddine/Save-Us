

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailLivraison extends StatefulWidget {
 DetailLivraison({Key? key}) : super(key: key);

  @override
  State<DetailLivraison> createState() => _DetailLivraisonState();
}

class _DetailLivraisonState extends State<DetailLivraison> {
 final adressContr=TextEditingController();

 final nbsdfContr=TextEditingController();

 final descriptionContr=TextEditingController();

 late final _formKey = GlobalKey<FormState>();

 late final Position currentPosition;
 var  geoLocator=Geolocator();
 void locatePosition(){

 }
  @override
 

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Livraison"),
      ),
  
      body:SafeArea(
           child: Expanded(
             child: Stack(
               children: [
                 
                 const GoogleMap(
                 initialCameraPosition: CameraPosition(
                 target: LatLng(35.69111, -0.64167),zoom: 12),),
                
                 Positioned(
                   left: 0.0,
                   right:0.0 ,
                   bottom: 0.0,
                   top: 300.0,
                   child:Container(
                     width: MediaQuery.of(context).size.width,
                     height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(60),  
                     ),
                    boxShadow: [
                       BoxShadow(
                         blurRadius: 16.0,
                         spreadRadius: 0.5,
                       color: Colors.grey,
                       offset: Offset(0.7, 0.7)
                     )
                    ]
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:  const [
                        SizedBox(height: 20,),
                        Text("Détail de cette livraison",style:  TextStyle(color: Color.fromARGB(255, 53, 119, 174,),fontWeight: FontWeight.bold,fontSize: 20),),  
                        SizedBox(height: 10,),
                        
                      ]
                  )
                 
           
                   )))]),
           )
           ),
          );
  }
}
