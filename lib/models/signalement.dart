class Signalement {
  Signalement({
    required this.id,
    required this.description,
    required this.sdfNumber,
   // required this.idResto,
    required this.date,
    required this.etat,
    required this.positionX,
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
  //final String idLivreur;
  
  factory Signalement.fromMapSignalement(Map<String, dynamic> data, String documentId) {
    final String id = documentId;
   // final String idResto = data['idResto'] as String;
    final DateTime date =data['date'] as DateTime;
    final int sdfNumber = data['sdfNumber'] as int;
    final String description = data['description'] as String;
    final bool etat= data['etat'] as bool;
    final String positionX=data['posituinX']as String;
    final String positionY=data['posituinY']as String;
    final int wilaya = data['wilaya'] as int;
   // final String idLivreur = data['idLivreur'] as String;
    return Signalement(
      id: id,
     // idResto: idResto,
      date: date,
      description:description,
      sdfNumber: sdfNumber,
      etat: etat,
      positionX: positionX,
      positionY: positionY, wilaya: wilaya,
      //idLivreur: idLivreur,
    );
  }
  Map<String, dynamic> toMapSignalement() {
    return {
      
     // 'idResto' : idResto,
      'date': date,
      'description':description,
      'sdfNumber': sdfNumber,
      'etat': etat,
      'positionX': positionX,
      'positionY': positionY, 'wilaya': wilaya,
     // 'idLivreur': idLivreur,

    };
  }
}