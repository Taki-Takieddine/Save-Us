class Users {
  Users({
    required this.id,
    required this.type,
    required this.name,
    required this.phoneNumber,
    required this.wilaya,
  });

  //type 0 admin
  //type 1 resto
  //type 2 livreur
  final String id;
  final int type;
  final String name;
  final int phoneNumber;
  final int wilaya;
  
  factory Users.fromMap(Map<String, dynamic> data, String documentId) {
    final String id = documentId;
    final int type =data['type'] as int;
    final String name = data['name'] as String;
    final int phoneNumber = data['phoneNumber'] as int;
    final int wilaya = data['wilaya'] as int;
    return Users(
      id: id,
      type: type,
      name: name,
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
      'name': name,
      'type':type,
      'phoneNumber': phoneNumber,
      'wilaya': wilaya,

    };
  }
}