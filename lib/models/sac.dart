class Users {
  Users({
    required this.id,
    required this.dateDepo,
    required this.dateLiv,
    required this.idSac,
    required this.statue,
  });

  final String id;
  final String idSac;
  final bool statue;
  final DateTime dateDepo;
  final DateTime dateLiv;
  
  factory Users.fromMap(Map<String, dynamic> data, String documentId) {
    final String id = documentId;
    final bool statue = data['statue'] as bool;
    final DateTime dateDepo =data['dateDepo'] as DateTime;
    final DateTime dateLiv =data['dateLiv'] as DateTime;
    final String idSac = data['idSac'] as String;
    
    return Users(
      id: id,
      dateDepo: dateDepo,
      dateLiv: dateLiv, 
      statue: statue, 
      idSac: idSac,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'dateDepo': dateDepo,
      'dateLiv': dateLiv, 
      'statue': statue, 
      'idSac': idSac,
      

    };
  }
}