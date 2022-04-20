import 'package:applicationmemoire/user.dart';

class Resto {
  final String nomresto;
  final String adressresto ;
  final String id;
  final int type;
  final String name;
  final int phoneNumber;
  final int wilaya;
  
  Resto(
    
    {
    required this.id,
    required this.type,
    required this.name,
    required this.phoneNumber,
    required this.wilaya,
    required this.nomresto, 
    required this.adressresto, 
  }
    
) 
     
;

factory Resto.fromMap(Map<String, dynamic> data, String documentId) {
    final String id = documentId;
    final int type =data['type'] as int;
    final String name = data['name'] as String;
    final int phoneNumber = data['phoneNumber'] as int;
    final int wilaya = data['wilaya'] as int;
    final String nomresto=data['nomresto']as String;
    final String adressresto=data['adressresto']as String;
    return Resto(
      id: id,
      type: type,
      name: name,
      phoneNumber: phoneNumber,
      wilaya: wilaya,
      nomresto: nomresto,
      adressresto: adressresto,
    );
  }
   @override
  Map<String, dynamic> toMapResto() {
    // TODO: implement toMap
    return {
     'nomresto':nomresto,
     'adressresto':adressresto,
     'name': name,
      'type':type,
      'phoneNumber': phoneNumber,
      'wilaya': wilaya,
    };
  }
}