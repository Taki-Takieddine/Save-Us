class Users {
  Users({
    required this.id,
    required this.description,
    required this.sdfNumber,
    required this.idSignal,
    required this.date,
    required this.etat,
    required this.heure,
    required this.positionX,
    required this.positionY,
    required this.wilaya,
  });

  //type 0 admin
  //type 1 resto
  //type 2 livreur
  final String id;
  final String idSignal;
  final DateTime date;
  final DateTime heure;
  final String description;
  final int sdfNumber;
  final bool etat;
  final String positionX;
  final String positionY;
  final int wilaya;
  
  factory Users.fromMap(Map<String, dynamic> data, String documentId) {
    final String id = documentId;
    final String idSignal = data['idSignal'] as String;
    final DateTime date =data['date'] as DateTime;
    final DateTime heure = data['heure'] as DateTime;
    final int sdfNumber = data['sdfNumber'] as int;
    final String description = data['description'] as String;
    final bool etat= data['etat'] as bool;
    final String positionX=data['posituinX']as String;
    final String positionY=data['posituinY']as String;
    final int wilaya = data['wilaya'] as int;
    return Users(
      id: id,
      idSignal: idSignal,
      date: date,
      heure: heure,
      description:description,
      sdfNumber: sdfNumber,
      etat: etat,
      positionX: positionX,
      positionY: positionY, wilaya: wilaya,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      
      'idSignal' : idSignal,
      'date': date,
      'heure': heure,
      'description':description,
      'sdfNumber': sdfNumber,
      'etat': etat,
      'positionX': positionX,
      'positionY': positionY, 'wilaya': wilaya,

    };
  }
}