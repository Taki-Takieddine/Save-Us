import 'package:applicationmemoire/screen/livreur/livraison.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LivraisonCart extends StatelessWidget {
  const LivraisonCart({
    Key? key,
    required this.livraison,
  }) : super(key: key);

  final Livraison livraison;

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
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("hedi hiya la livrason la plus proche"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(livraison.resto.adressresto),
          Text(livraison.signalement.description),
        ],
      ),
      onTap: () {
        openMap(livraison);
      },
    );
  }
}
