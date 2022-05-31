
import 'package:applicationmemoire/auth/localisation.dart';
import 'package:applicationmemoire/screen/livreur/livraison.dart';
import 'package:applicationmemoire/screen/livreur/livreur_screen.dart';
import 'package:applicationmemoire/screen/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailLivraison extends StatefulWidget {
  
final Livraison Liv;
  const DetailLivraison(
      {Key? key,
     required this.Liv})
      : super(key: key);

  @override
  State<DetailLivraison> createState() => _DetailLivraisonState();
}

class _DetailLivraisonState extends State<DetailLivraison> {
  final Set<Marker> _markers = {};
  late String locLatitude;
  late String locLongitude;
  GoogleMapController? _controller;
  Location currentLocation = Location();
  Future<void> openMap(Livraison l) async {
    String googleUrl =
        'https://www.google.com/maps/dir/?api=1&destination=${l.signalement.positionX},${l.signalement.positionY}&waypoints=${l.resto.positionX},${l.resto.positionY}';

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      //throw 'Could not open the map.';
    }
  }
  
  @override
  void initState() {
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
       
    super.initState();
  }
  @override
  var see = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Center(child: Text("Détails livraison")),
        backgroundColor: const Color.fromARGB(255, 53, 119, 174),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: ((MediaQuery.of(context).size.height) / 2) - 100,
              child: Stack(children: [
                GoogleMap(
                  zoomControlsEnabled: false,
                  mapToolbarEnabled: false,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(48.8561, 2.2930),
                    zoom: 12.0,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                  },
                  markers: _markers,
                ),
              ]),
            ),
            Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: ((MediaQuery.of(context).size.height) / 2) + 14.9,
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          blurRadius: 16.0,
                          spreadRadius: 0.5,
                          color: Colors.grey,
                          offset: Offset(0.7, 0.7))
                    ]),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Détails de la livraison",
                            style: TextStyle(
                                color: Color.fromARGB(
                                  255,
                                  53,
                                  119,
                                  174,
                                ),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Container(
                              height:
                                  ((MediaQuery.of(context).size.height) / 2) -
                                      150,
                              width: MediaQuery.of(context).size.width - 70,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 53, 119, 174),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                         
                                            
                                            SingleChildScrollView(
                                              scrollDirection:
                                                          Axis.horizontal,
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.circle,
                                                    color: Colors.white,
                                                    size: 8,
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    'Adresse de(s) SDF :',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  widget.Liv.signalement.adressSDF.toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13),
                                                )
                                              ]),
                                            ),
                                            const SizedBox(height: 15),
                                             SingleChildScrollView(
                                              scrollDirection:
                                                          Axis.horizontal,
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.circle,
                                                    color: Colors.white,
                                                    size: 8,
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    'Adresse du resto :',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  widget.Liv.resto.adressresto.toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13),
                                                )
                                              ]),
                                            ),
                                            const SizedBox(height: 15),
                                             SingleChildScrollView(
                                            scrollDirection:
                                             Axis.horizontal,
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.circle,
                                                    color: Colors.white,
                                                    size: 8,
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    'ID des sac pour cette livraison la livraison :',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                             
                                                  SingleChildScrollView(
                                                   scrollDirection:
                                                  Axis.horizontal,
                                                  child: Column(
                                                    children:[
                                                      const SizedBox(height: 5,),
                                                       for(var i=0;i<widget.Liv.sacList.length;i++)
                                                      Text(
                                                    widget.Liv.sacList[i].id.toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 13),
                                                  ),
                                              
                                                    ] 
                                                  ),
                                                )
                                              
                                            ]),
                                            const SizedBox(height: 15),
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons.circle,
                                                  color: Colors.white,
                                                  size: 8,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  'Nombre de SDF sur place :',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                widget.Liv.signalement.sdfNumber.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13),
                                              )
                                            ]),
                                            const SizedBox(height: 15),
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons.circle,
                                                  color: Colors.white,
                                                  size: 8,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  'Description:',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                widget.Liv.signalement.description.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13),
                                              )
                                            ]),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (see == 0)
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                     
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: ((context) =>
                                                              const LivreurScreen(
                                                                  title: ''))));
                                        },
                                    
                                    child: Container(
                                      height: 60,
                                      width: 120,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: const [
                                             Icon(
                                              Icons.arrow_back_ios,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "Retour",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                           
                                          ],
                                        ),
                                      ),
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      showDialog<void>(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Confirmation'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: const <Widget>[
                                                    Text(
                                                        'êtes-vous vraiment sûr de vouloir accepter'),
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
                                                    Navigator.of(context).pop();
                                                    setState(() {
                                                      see = 1;
                                                    });
                                                  },
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 120,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 109, 189, 112),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Text(
                                              "Accepter ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Icon(
                                              Icons.done,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          if (see == 1)
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible:
                                            false, 
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title:
                                                const Text('Nos remerciements'),
                                            content: SingleChildScrollView(
                                              child: ListBody(
                                                children: const <Widget>[
                                                  Text(
                                                      'Un énorme remerciement de la part de notre équipe ,à la prochaine livraison'),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('OK'),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: ((context) =>
                                                              const LivreurScreen(
                                                                  title: ''))));
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 120,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Text(
                                              "Fini",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Icon(
                                              Icons.done,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      openMap(widget.Liv);
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 120,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 109, 189, 112),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Text(
                                              "Itinéraire ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Icon(
                                              Icons.near_me,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                              ],
                            )
                        ],
                      ),
                    )),
              ],
            ),
          ]),
    ));
  }
  
  
}
