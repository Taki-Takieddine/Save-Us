import 'package:applicationmemoire/screen/livreur/livraison.dart';
import 'package:applicationmemoire/screen/livreur/livraison_cart.dart';
import 'package:applicationmemoire/screen/livreur/livreur_bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


import '../navbar.dart';

class LivreurScreen extends StatefulWidget {
  const LivreurScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LivreurScreen> createState() => _LivreurScreenState();
}

class _LivreurScreenState extends State<LivreurScreen> {
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Center(child: Text('Livreur')),
          backgroundColor: Colors.purple,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                  Colors.purple,
                  Colors.blueAccent,
                ])),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(
                children: [
                  FutureBuilder<Position>(
                      future: determinePosition(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData && (snapshot.data != null)) {
                          var position = snapshot.data!;
                          return FutureBuilder<List<Livraison>>(
                            future: LivreurBloc(position).getLivraison(),
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.hasData && (snapshot.data != null)) {
                                var livraison = snapshot.data;
                                return SingleChildScrollView(
                            child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: livraison?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return LivraisonCart(livraison:livraison![index]);}));
                              } else if (snapshot.hasError) {
                                return CircularProgressIndicator();
                              }
                              return CircularProgressIndicator();
                            },
                          );
                        } else if (snapshot.hasError) {
                          return CircularProgressIndicator();
                        }
                        return CircularProgressIndicator();
                      })
                ],
              ),
            ),
          ),
        )));
  }
}
