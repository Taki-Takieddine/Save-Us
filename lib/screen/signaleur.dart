

import 'package:applicationmemoire/auth/localisation.dart';
import 'package:applicationmemoire/choose_profil.dart';
import 'package:applicationmemoire/models/signalement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Signaleur extends StatefulWidget {
 const Signaleur({Key? key}) : super(key: key);

  @override
  State<Signaleur> createState() => _SignaleurState();
}

class _SignaleurState extends State<Signaleur> {


  final adressContr=TextEditingController();

 final nbsdfContr=TextEditingController();

 final descriptionContr=TextEditingController();

 late final _formKey = GlobalKey<FormState>();
  GoogleMapController? _controller;
  Location currentLocation = Location();
 final Set<Marker> _markers={};
 late String locLatitude;
 late String locLongitude;
  void getLocation()async{
    currentLocation.onLocationChanged.listen((LocationData loc){
 
      _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 14.0,
      )));
      
      locLatitude = loc.latitude.toString();
      locLongitude = loc.longitude.toString();
      setState(() {
       // _markers.clear();
        var mark =Marker(markerId: const MarkerId('votre position'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
        );
        if(!_markers.contains(mark)) {
          _markers.add(Marker(markerId: const MarkerId('votre position'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
        ));
        }
       
        
      });
       });
       
  }
  
  @override
  void initState(){
  getUserLocation();
    getLocation();
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 53, 119, 174),
        appBar: AppBar(
          title:const  Text("Signalement"),
        ),
        body:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               SizedBox(
                 width:MediaQuery.of(context).size.width, 
                 height: ((MediaQuery.of(context).size.height)/2)-100,
                 child: 
                  Stack(
                   children:[
                     GoogleMap(
                        zoomControlsEnabled: false,
                         mapToolbarEnabled: false,
                        initialCameraPosition:const CameraPosition(
                          target: LatLng(48.8561, 2.2930),
                          zoom: 12.0,
                        ),
                        
                        onMapCreated: (GoogleMapController controller){
                          _controller = controller;
                        },
                        markers: _markers,
                       ),
                      Positioned(
                       left: MediaQuery.of(context).size.width-100,
                       right:0.0 ,
                       bottom:10,
                       top:220 ,
                       child:GestureDetector(
                                        onTap: ()async {
                                    
                                          getLocation();
                                          
                                        },
                                        child: Container(
                 
                                          margin: const EdgeInsets.symmetric(horizontal: 20),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(200),
                                             boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 16.0,
                                                spreadRadius: 0.5,
                                              color: Colors.grey,
                                              offset: Offset(0.7, 0.7)
                                            )
                                            ]
                                          ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.add_location,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),),
                   ], 
                 ),
                     
               ),
                 
                           Container(
                         width: MediaQuery.of(context).size.width,
                         height: ((MediaQuery.of(context).size.height)/2)+14.9,
                        decoration: const BoxDecoration(
                        color: Colors.white,
                        
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
                          children:  [
                            const SizedBox(height: 10,),
                            const Text("Aidez-nous a signaler les SDF",style:  TextStyle(color: Color.fromARGB(255, 53, 119, 174,),fontWeight: FontWeight.bold,fontSize: 20),),  
                            const SizedBox(height: 10,),
                             Padding(
                               padding: const EdgeInsets.all(30),
                               child: Form(
                                    key: _formKey,
                                    child: Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                           Container(
                                             height: 50,
                                             decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey),
                                               color:Colors.white,
                                               borderRadius:BorderRadius.circular(5) ,
                                             ),
                                             child: Row(
                                               children: [
                                                 const SizedBox(width: 8,),
                                                 const Icon(
                                                  Icons.add_location,
                                                  color: Colors.green,
                                                ),
                                                Center(
                                                  child: Column(
                                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                    const SizedBox(height: 8,),
                                                    Text(adressUser),
                                                    Text(adressUsers),
                                                  ],)
                                                )
                                               ],
                                             ),
                                           ),
                                            const SizedBox(height: 10,),
                                            TextFormField(
                                              controller: nbsdfContr,
                                              decoration: const InputDecoration(
                                                labelText: 'Nombre des SDF',
                                                border: OutlineInputBorder(),
                                                prefixIcon: Icon(
                                                  Icons.tag,
                                                  color: Colors.green,
                                                ),
                                                labelStyle: TextStyle(
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              keyboardType: TextInputType.number,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Combien y-a-t-il de SDF';
                                                }
                                                               
                                                return null;
                                              },
                                              onSaved: (value) {
                                                nbsdfContr.text = value.toString();
                                              },
                                            ),
                                           const SizedBox(height: 10,),
                                            TextFormField(
                                              minLines: 3, 
                                              keyboardType: TextInputType.multiline,
                                              maxLines: 15,
                                              controller: descriptionContr,
                                              decoration: const InputDecoration(
                                                labelText: 'Description',
                                                border: OutlineInputBorder(),
                                                prefixIcon: Icon(
                                                  Icons.navigate_next_rounded,
                                                  color: Colors.green,
                                                ),
                                                labelStyle: TextStyle(
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                               validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'decrivez-nous le(s) SDF';
                                                }
                                                               
                                                return null;
                                              },
                                              onSaved: (value) {
                                                descriptionContr.text = value!;
                                              },
                                            ),
                                          
                                            const SizedBox(height: 30,),
                                            //bouton
                                             GestureDetector(
                                              onTap: () {
                                                final signal=Signalement(
                                                  date: DateTime.now(), 
                                                  description: descriptionContr.text, 
                                                  etat: true, 
                                                  id: '',
                                                  positionX: locLatitude, 
                                                  positionY: locLongitude, 
                                                  sdfNumber: int.parse(nbsdfContr.text), 
                                                  wilaya: 31, adressSDF: adressUser+adressUsers);
                                                
                                              createSignal(signal);
                                              _showMyDialog();
                                              },
                                              child: Container(
                                                height: 50,
                                                margin: const EdgeInsets.symmetric(horizontal: 50),
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                              child: const Center(
                                                child: Text(
                                                  "Confirmer",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            )),
              ], 
            ) ,
          ),
               
              )
              )
              )
              ]
              )
              )
              )
             ] ),
        )
          ,
        )
          );
  }
  Future createSignal(Signalement sac) async {
    final docsac = FirebaseFirestore.instance.collection('signalement').doc();
    await docsac.set(sac.toMapSignalement());
  }
  Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmation du signal'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Voulez vous vraiment confirmer se signal ?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(' Non'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Oui'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) =>
                                            const ChooseProfil(title: '',))));
            },
          ),
        ],
      );
    },
  );
}

}
