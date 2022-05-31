import 'package:cloud_firestore/cloud_firestore.dart';

class Signalement {
  Signalement({
    required this.id,
    required this.adressSDF,
    required this.description,
    required this.sdfNumber,
    // required this.idResto,
    required this.date,
    required this.etat,
    // positionX mean latitude
    required this.positionX,
    // positionY mean longitude
    required this.positionY,
    //required this.idLivreur,
    required this.wilaya,
  });
  final String id;
  //final String idResto;
  final DateTime date;
  final String description;
  final int sdfNumber;
  final bool etat;
  final String positionX;
  final String positionY;
  final int wilaya;
  final String adressSDF;
  //final String idLivreur;

  factory Signalement.fromMapSignalement(
      Map<String, dynamic> data, String documentId) {
    final String id = documentId;
    // final String idResto = data['idResto'] as String;
    final DateTime date = (data['date'] as Timestamp).toDate();
    final int sdfNumber = data['sdfNumber'] as int;
    final String description = data['description'] as String;
    final bool etat = data['etat'] as bool;
    final String positionX = data['positionX'] as String;
    final String positionY = data['positionY'] as String;
    final String adressSDF = data['adressSDF'] as String;
    final int wilaya = data['wilaya'] as int;
    // final String idLivreur = data['idLivreur'] as String;
    return Signalement(
      id: id,
      // idResto: idResto,
      date: date,
      description: description,
      sdfNumber: sdfNumber,
      etat: etat,
      positionX: positionX,
      positionY: positionY, wilaya: wilaya, adressSDF: adressSDF,
      //idLivreur: idLivreur,
    );
  }
  Map<String, dynamic> toMapSignalement() {
    return {
      // 'idResto' : idResto,
      'date': date,
      'description': description,
      'sdfNumber': sdfNumber,
      'etat': etat,
      'positionX': positionX,
      'positionY': positionY, 'wilaya': wilaya,
      'adressSDF': adressSDF,
      // 'idLivreur': idLivreur,
    };
  }
}
