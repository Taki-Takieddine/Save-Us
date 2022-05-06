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
 
 
  void getLocation()async{
    currentLocation.onLocationChanged.listen((LocationData loc){
 
      _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 14.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        _markers.clear();
        _markers.add(Marker(markerId: const MarkerId('votre position'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
        ));
        print('markersss');
        print(_markers);
      });
       });
  }
 
  @override
  
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:const  Text("Signalement"),
        ),
        body: 
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
                     left: 290.0,
                     right:0.0 ,
                     bottom:645.0,
                     top: 15.0,
                     child:GestureDetector(
                                      onTap: () {
       
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
                        children:  [
                          const SizedBox(height: 20,),
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
                                          TextFormField(
                                            controller: adressContr,
                                            decoration: const InputDecoration(
                                              labelText: 'Position acctuelle',
                                              border: OutlineInputBorder(),
                                              prefixIcon: Icon(
                                                Icons.add_location,
                                                color: Colors.green,
                                              ),
                                              labelStyle: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            keyboardType: TextInputType.text,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'entrer une position en cliquant sur le bouton';
                                              }
                                                             
                                              return null;
                                            },
                                            onSaved: (value) {
                                              adressContr.text = value!;
                                            },
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
                                            minLines: 3, // any number you need (It works as the rows for the textarea)
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
                                        
                                          const SizedBox(height: 20,),
                                          //bouton
                                           GestureDetector(
                                            onTap: () {
                                            
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
       
      )))]))))])));
  }
}
