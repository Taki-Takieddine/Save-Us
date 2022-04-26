class Users {
  Users({
    required this.id,
    required this.dateDepo,
    required this.dateLiv,
    required this.idResto,
    required this.statue,
    required this.idLivreur,
  });

  final String id;
  final String idResto;
  final bool statue;
  final String idLivreur;
  final DateTime dateDepo;
  final DateTime dateLiv;
  
  factory Users.fromMap(Map<String, dynamic> data, String documentId) {
    final String id = documentId;
    final bool statue = data['statue'] as bool;
    final DateTime dateDepo =data['dateDepo'] as DateTime;
    final DateTime dateLiv =data['dateLiv'] as DateTime;
    final String idResto = data['idResto'] as String;
    final String idLivreur = data['idLivreur'] as String;
    
    return Users(
      id: id,
      dateDepo: dateDepo,
      dateLiv: dateLiv, 
      statue: statue, 
      idResto: idResto,
      idLivreur: idLivreur,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'dateDepo': dateDepo,
      'dateLiv': dateLiv, 
      'statue': statue, 
      'idResto': idResto,
      'idLivreur': idLivreur,
    };
  }
}