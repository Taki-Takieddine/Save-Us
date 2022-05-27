import 'package:applicationmemoire/auth/localisation.dart';
import 'package:url_launcher/url_launcher.dart';


class MapUtils{
  MapUtils._();
  static Future <void> openMap(
                        double latitude,
                        double longtitude,
  )async {

   final Uri googlemapURL = Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longtitude');
   if(await canLaunchUrl(googlemapURL)){
     await launchUrl(googlemapURL);
   }
   else{
     throw 'mbghach ytlaaaaaaaaaaaaaaaaaaaaaaaa3hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh';
   }
  }
}