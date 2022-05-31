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

  List<Livraison> getLivraisonPossible(
    List<Resto> restoList,
    List<Signalement> signalamentList,
    List<Sac> sacs,
  ) {
    List<Livraison> livraisonPossible = [];
    for (Resto resto in restoList) {
      final List<Sac> sacInRestoList = [];
      sacInRestoList
          .addAll(sacs.where((element) => element.idResto == resto.idUser));

      for (Signalement signalement in signalamentList) {
        // khess ykoun adena le nombre de sac  egale a le nombre de sdf
        int sacInRestoListLength = sacInRestoList.length;
        for (int i = 0;
            i < (sacInRestoListLength - signalement.sdfNumber);
            i++) {
          sacInRestoList.removeLast();
        }

        if (sacInRestoList.length == signalement.sdfNumber) {
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
          Livraison livraison = Livraison(
            signalement: signalement,
            resto: resto,
            sacList: List.from(sacInRestoList),
            dest: total,
          );
          livraisonPossible.add(livraison);
        }
      }
    }
    return livraisonPossible;
  }

  Future<List<Livraison>> getLivraison() async {
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
    // print('******************************');
    // print(livraisonPossibleList);
    return livraisonPossibleList;
  }
}
