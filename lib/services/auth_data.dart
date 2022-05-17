import 'package:cloud_firestore/cloud_firestore.dart';

class AuthData {
  Future getTypeUser(String idUser) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('idUser', isEqualTo: idUser)
        .get();
    return snapshot.docs[0]['type'];
  }
}
