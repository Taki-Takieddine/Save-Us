import 'package:applicationmemoire/screen/livreur.dart';
import 'package:applicationmemoire/screen/navbar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DetailLivraison extends StatefulWidget {
 const DetailLivraison({Key? key}) : super(key: key);

  @override
  State<DetailLivraison> createState() => _DetailLivraisonState();
}

class _DetailLivraisonState extends State<DetailLivraison> {
 final Set<Marker> _markers={};
 late String locLatitude;
 late String locLongitude;  GoogleMapController? _controller;
  Location currentLocation = Location();

  void getLocation()async{
 
    currentLocation.onLocationChanged.listen((LocationData loc){
 
      _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 14.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      locLatitude = loc.latitude.toString();
      locLongitude = loc.longitude.toString();
      setState(() {
        print("oizhgoifh $_markers");
       // _markers.clear();
        var mark =Marker(markerId: const MarkerId('votre position'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
        );
        if(!_markers.contains(mark)) {
          _markers.add(Marker(markerId: const MarkerId('votre position'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
        ));
        }
       
        print("dlqig eihio fehoh oihe $_markers");
      });
       });
  }
 
  @override
 

  Widget build(BuildContext context) {
    return SafeArea(
           child: Scaffold(
          drawer:const NavBar(),
          appBar: AppBar(
          title: const Center(child: Text("Détails livraison")) ,
          backgroundColor: const Color.fromARGB(255, 53, 119, 174),
        ),
             body: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                     children: [
               Container(
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
                   ]
                 ),
                     
               ),
                 
                           Column(
                             children:[ Container(
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
                                                     children:   [
                             const SizedBox(height: 10,),
                             const Text("Détails de la livraison",style:  TextStyle(color: Color.fromARGB(255, 53, 119, 174,),fontWeight: FontWeight.bold,fontSize: 20),),  
                             const SizedBox(height: 10,),
                             Padding(
                               padding: const EdgeInsets.fromLTRB(20, 10,20, 10),
                               child: Container(
                                 height: ((MediaQuery.of(context).size.height)/2)-150,
                                 width: MediaQuery.of(context).size.width-70,
                                 decoration: BoxDecoration(
                                   color:const Color.fromARGB(255, 53, 119, 174),
                                  borderRadius: BorderRadius.circular(15),
                                 ),
                                  child:SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:const EdgeInsets.all(20),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                                      children: [
                                                        Row(
                                                          
                                                  children:const[
                                                     Icon(Icons.circle,color: Colors.white,size: 8,),
                                                      SizedBox(width: 4,),
                                                     Text('ID du sac :',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                                                   SizedBox(width: 5,),
                                                   
                                                    Text("dfghioezertyui",style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),), 
                                                  ],
                                                ),
                                                const SizedBox(height: 5,),
                                                Row(
                                                  children: const [
                                                 Icon(Icons.circle,color: Colors.white,size: 8,),
                                                  SizedBox(width: 4,),
                                                 Text('Statue du sac :',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                                                  
                                                  SizedBox(width: 5,),
                                                  Text("sdfghjkzazlkltrez",style:  TextStyle(color:  Colors.white,fontWeight: FontWeight.bold,fontSize: 13)),
                                                  ],
                                                ),
                                                      ],
                                                    ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                             ),
                              const SizedBox(height: 10,),
                             Row(
                              children: [
                                GestureDetector(
                                            onTap: () {
                                              showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmation du Refus'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Voulez vous vraiment confirmer se refus ?'),
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
                                            const Livreur(title: ''))));
            },
          ),
        ],
      );
    },
  );
                                            },
                                            child: Container(
                                               height: 60,width: 120,
                                              margin: const EdgeInsets.symmetric(horizontal: 50),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            child:  Center(
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children:const [
                                                  
                                                   Text(
                                                  "Refuser",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Icon(Icons.clear,color: Colors.white,)
                                                ], 
                                              ),
                                            ),
                                          )),
                                         
                                           GestureDetector(
                                            onTap: () {
                                              
                                            },
                                            child: Container(
                                               height: 60,width: 120,
                                              margin: const EdgeInsets.symmetric(horizontal: 0),
                                              decoration: BoxDecoration(
                                                color:const Color.fromARGB(255, 109, 189, 112) ,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            child:  Center(
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children:const [
                                                 
                                                   Text(
                                                  "Itinéraire ",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Icon(Icons.near_me,color: Colors.white,)
                                                ], 
                                              ),
                                            ),
                                          )),
                                          
                              ],
                           )
                                         ], 
                                                ) ,
                                              )),

                            ],
                           ),
                           ]
                           
                           ),
           ));
      
  }
}
