class Users {
  Users({
    required this.id,
    required this.email,
    required this.type,
    required this.idUser,
    required this.name,
    required this.phoneNumber,
    required this.wilaya,
  });

  //type 0 admin
  //type 1 resto
  //type 2 livreur
  final String id;
  final String idUser;
  final String email;
  final int type;
  final String name;
  final int phoneNumber;
  final int wilaya;
  
  factory Users.fromMap(Map<String, dynamic> data, String documentId) {
    final String id = documentId;
    final String email = data['email'] as String;
    final int type =data['type'] as int;
    final String name = data['name'] as String;
    final int phoneNumber = data['phoneNumber'] as int;
    final String idUser = data['idUser'] as String;
    final int wilaya = data['wilaya'] as int;
    return Users(
      id: id,
      email: email,
      type: type,
      name: name,
      idUser: idUser,
      phoneNumber: phoneNumber,
      wilaya: wilaya,
    );
  }

/*factory User.fromMap2(Map<String, dynamic> data, String documentId) {
    final int type = data['type'] as int;
    if (type == 0) {
      return Restaurent.fromMap(data, documentId);
    }
    return User.fromMap(data, documentId);
  }
  */
  Map<String, dynamic> toMap() {
    return {
      'email':email,
      'name': name,
      'type':type,
      'idUser': idUser,
      'phoneNumber': phoneNumber,
      'wilaya': wilaya,

    };
  }

  data() {}
}