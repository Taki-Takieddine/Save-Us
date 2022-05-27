


import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
bool getLocation = false;
  bool isLoading = false;
late  String adressUser='Votre position';
late  String adressUsers='';

late final position ;
getUserLocation() async {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final lastPosition = await Geolocator.getLastKnownPosition();
      
      print(lastPosition);
      print('lalitude: ${position.longitude}, logitude: ${position.latitude}');
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      print('dosghi $placemarks');
      print("Street Address: ${placemarks[0].street}");
      print("City: ${placemarks[0].administrativeArea}");
      print("Region: ${placemarks[0].subAdministrativeArea}");
      print("code Postal: ${placemarks[0].postalCode}");
      print("Country Name: ${placemarks[0].country}");
      adressUser =
          '${placemarks[0].street} ${placemarks[0].subAdministrativeArea}';
          adressUsers =
          ' ${placemarks[0].administrativeArea} ${placemarks[0].country}';
}
