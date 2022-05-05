class Sac {
  Sac({
    required this.id,
    required this.dateDepo,
    required this.dateLiv,
    required this.idResto,
    required this.statue,
    required this.idLivreur,
  });

  late final String id;
  final String idResto;
  final bool statue;
  final String idLivreur;
  final DateTime dateDepo;
  final DateTime dateLiv;
  
  factory Sac.fromMapSac(Map<String, dynamic> data, String documentId) {
    final String id = documentId;
    final bool statue = data['statue'] as bool;
    final DateTime dateDepo =data['dateDepo'] as DateTime;
    final DateTime dateLiv =data['dateLiv'] as DateTime;
    final String idResto = data['idResto'] as String;
    final String idLivreur = data['idLivreur'] as String;
    
    return Sac(
      id: id,
      dateDepo: dateDepo,
      dateLiv: dateLiv, 
      statue: statue, 
      idResto: idResto,
      idLivreur: idLivreur,
    );
  }
  Map<String, dynamic> toMapSac() {
    return {
      'dateDepo': dateDepo,
      'dateLiv': dateLiv, 
      'statue': statue, 
      'idResto': idResto,
      'idLivreur': idLivreur,
      
    };
  }
}