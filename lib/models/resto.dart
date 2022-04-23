class Resto {
  final String nomresto;
  final String adressresto;
  final String id;
  final int type;
  final String idUser;
  final String name;
  final int phoneNumber;
  final int wilaya;
  final String email;

  Resto({
    required this.id,
    required this.type,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.wilaya,
    required this.idUser,
    required this.nomresto,
    required this.adressresto,
  });

  factory Resto.fromMap(Map<String, dynamic> data, String documentId) {
    final String id = documentId;
    final int type = data['type'] as int;
    final String name = data['name'] as String;
    final String email = data['email'] as String;
    final int phoneNumber = data['phoneNumber'] as int;
    final int wilaya = data['wilaya'] as int;
    final String nomresto = data['nomresto'] as String;
    final String idUser = data['idUser'] as String;
    final String adressresto = data['adressresto'] as String;
    return Resto(
      id: id,
      idUser: idUser,
      email: email,
      type: type,
      name: name,
      phoneNumber: phoneNumber,
      wilaya: wilaya,
      nomresto: nomresto,
      adressresto: adressresto,
    );
  }
  Map<String, dynamic> toMapResto() {
    return {
      'nomresto': nomresto,
      'adressresto': adressresto,
      'name': name,
      'idUser': idUser,
      'type': type,
      'phoneNumber': phoneNumber,
      'wilaya': wilaya,
      'email': email,
    };
  }
}
