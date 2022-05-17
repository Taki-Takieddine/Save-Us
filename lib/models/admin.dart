import 'package:applicationmemoire/models/user.dart';

class Admins extends Users {
  Admins({
    required String id,
    required int type,
    required String idUser,
    required String name,
    required int phoneNumber,
    required int wilaya,
    required String email,
  }) : super(
          id: id,
          email: email,
          type: type,
          name: name,
          idUser: idUser,
          phoneNumber: phoneNumber,
          wilaya: wilaya,
          stars: 0,
        );

  factory Admins.fromMap(Map<String, dynamic> data, String documentId) {
    final String id = documentId;
    final String email = data['email'] as String;
    final int type = data['type'] as int;
    final String name = data['name'] as String;
    final int phoneNumber = data['phoneNumber'] as int;
    final String idUser = data['idUser'] as String;
    final int wilaya = data['wilaya'] as int;
    return Admins(
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
  @override
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'type': type,
      'idUser': idUser,
      'phoneNumber': phoneNumber,
      'wilaya': wilaya,
    };
  }
}
