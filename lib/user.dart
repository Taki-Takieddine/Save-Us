
class User {
  User({
    required this.id,
    required this.type,
    required this.name,
    required this.phoneNumber,
    required this.wilaya,
    required this.mdp,
    required this.email,
  });

  //type 0 admin
  //type 1 resto
  //type 2 livreur
  final String id;
  final int type;
  final String name;
  final String phoneNumber;
  final int wilaya;
  final String mdp;
  final String email;

  factory User.fromMap(Map<String, dynamic> data, String documentId) {
    final String id = documentId;
    final int type =data['type'] as int;
    final String name = data['name'] as String;
    final String phoneNumber = data['phoneNumber'] as String;
    final int wilaya = data['wilaya'] as int;
    final String mdp = data['mdp'] as String;
    final String email = data['email'] as String;
    return User(
      id: id,
      type: type,
      name: name,
      phoneNumber: phoneNumber,
      wilaya: wilaya,
      mdp:mdp,
      email:email,
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
      'phoneNumber': phoneNumber,
      'wilaya': wilaya,
      'mdp':mdp,
      'email':email,
    };
  }
}