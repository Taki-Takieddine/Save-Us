import 'package:applicationmemoire/models/resto.dart';
import 'package:applicationmemoire/models/sac.dart';
import 'package:applicationmemoire/models/signalement.dart';
import 'package:applicationmemoire/screen/livreur/livraison.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class LivreurBloc {
  Position? livreurPosition;

  LivreurBloc(this.livreurPosition);

  /// yjib ge3 les sac
  Future<List<Sac>> getListSacs() async {
    QuerySnapshot<Map<String, dynamic>> list = await FirebaseFirestore.instance
        .collection('sac')
        .where('statue', isEqualTo: true)
        .get();
    return list.docs.map((e) => Sac.fromMapSac(e.data(), e.id)).toList();
  }

  /// yjib ge3 les signalment
  Future<List<Signalement>> getListSignalement() async {
    QuerySnapshot<Map<String, dynamic>> list =
        await FirebaseFirestore.instance.collection('signalement').get();
    return list.docs
        .map((e) => Signalement.fromMapSignalement(e.data(), e.id))
        .toList();
  }

  /// te3tih id te3 resto yjiblek resto
  Future<Resto> getRestoById(String id) async {
    var document = await FirebaseFirestore.instance
        .collection('Users')
        .where('idUser', isEqualTo: id)
        .get();
    return Resto.fromMap(document.docs.first.data(), document.docs.first.id);
  }

  /// yjib resto ge3 grib li 3andeh au moins un sac
  Resto getClosestResto(List<Resto> restoList) {
    Resto closestResto = restoList[0];
    double smallestDistance = double.maxFinite;
    for (Resto resto in restoList) {
      double distanceInMeters = Geolocator.distanceBetween(
        livreurPosition!.latitude,
        livreurPosition!.longitude,
        double.parse(resto.positionX),
        double.parse(resto.positionY),
      );

      if (distanceInMeters < smallestDistance) {
        closestResto = resto;
        smallestDistance = distanceInMeters;
      }
    }
    return closestResto;
  }

  /// yjib signlament ge3 grib par rapport lel resto ge3 grib
  Signalement getClosestSignalementByResto(
    List<Signalement> signalementsList,
    Resto closestResto,
  ) {
    Signalement closestSignalement = signalementsList[0];
    double smallestDistance = double.maxFinite;
    for (Signalement signalement in signalementsList) {
      double distanceInMeters = Geolocator.distanceBetween(
        livreurPosition!.latitude,
        livreurPosition!.longitude,
        double.parse(signalement.positionX),
        double.parse(signalement.positionY),
      );

      if (distanceInMeters < smallestDistance) {
        closestSignalement = signalement;
        smallestDistance = distanceInMeters;
      }
    }
    return closestSignalement;
  }

  List<Livraison> getLivraisonPossible(
    List<Resto> restoList,
    List<Signalement> signalamentList,
    List<Sac> sacs,
  ) {
    List<Livraison> livraisonPossible = [];
    for (Resto resto in restoList) {
      int sacForResto =
          sacs.where((element) => element.idResto == resto.idUser).length;

      for (Signalement signalement in signalamentList) {
        if (sacForResto >= signalement.sdfNumber) {
          double dsLivreurResto = Geolocator.distanceBetween(
            livreurPosition!.latitude,
            livreurPosition!.longitude,
            double.parse(resto.positionX),
            double.parse(resto.positionY),
          );

          double dsRestoSign = Geolocator.distanceBetween(
            double.parse(resto.positionX),
            double.parse(resto.positionY),
            double.parse(signalement.positionX),
            double.parse(signalement.positionY),
          );
          double total = dsLivreurResto + dsRestoSign;

          livraisonPossible.add(
              Livraison(signalement: signalement, resto: resto, dest: total));
        }
      }
    }
    return livraisonPossible;
  }

  Future<Livraison> getLivraison() async {
    List<Sac> sacs = await getListSacs();
    //
    Set<String> restoIdsList = sacs.map((e) => e.idResto).toSet();
    List<Future<Resto>> restosFuture =
        restoIdsList.map((restoId) => getRestoById(restoId)).toList();
    List<Resto> restoList = await Future.wait(restosFuture);
    //
    List<Signalement> signalements = await getListSignalement();
    //
    var livraisonPossibleList =
        getLivraisonPossible(restoList, signalements, sacs);
    livraisonPossibleList.sort((a, b) => a.dest.compareTo(b.dest));
    print(livraisonPossibleList);
    return livraisonPossibleList.first;
  }
}
