import 'package:applicationmemoire/models/user.dart';

class Resto extends Users {
  final String nomresto;
  final String adressresto;
  final int nombreDonationTotal;
  final int nombreDonation;
  final int stars;

  Resto({
    required String id,
    required int type,
    required String idUser,
    required String name,
    required int phoneNumber,
    required int wilaya,
    required String email,
    required this.nomresto,
    required this.adressresto,
    required this.nombreDonationTotal,
    required this.nombreDonation,
    required this.stars,
  }) : super(
          id: id,
          nombreDonation: nombreDonation,
          nombreDonationTotal: nombreDonationTotal,
          nomresto: nomresto,
          adressresto: adressresto,
          email: email,
          type: type,
          name: name,
          idUser: idUser,
          stars: stars,
          phoneNumber: phoneNumber,
          wilaya: wilaya,
        );

  factory Resto.fromMap(Map<String, dynamic> data, String documentId) {
    final String id = documentId;
    final int type = data['type'] as int;
    final int stars = data['stars'] as int;
    final String name = data['name'] as String;
    final String email = data['email'] as String;
    final int phoneNumber = data['phoneNumber'] as int;
    final int wilaya = data['wilaya'] as int;
    final int nombreDonationTotal = data['nombreDonationTotal'] as int;
    final int nombreDonation = data['nombreDonation'] as int;
    final String nomresto = data['nomresto'] as String;
    final String idUser = data['idUser'] as String;
    final String adressresto = data['adressresto'] as String;
    return Resto(
      id: id,
      stars: stars,
      idUser: idUser,
      email: email,
      type: type,
      name: name,
      phoneNumber: phoneNumber,
      wilaya: wilaya,
      nomresto: nomresto,
      adressresto: adressresto,
      nombreDonationTotal: nombreDonationTotal,
      nombreDonation: nombreDonation,
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
      'nombreDonation': nombreDonation,
      'nombreDonationTotal': nombreDonationTotal,
      'stars': stars
    };
  }
}
