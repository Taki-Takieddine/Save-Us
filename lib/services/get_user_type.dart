// import 'package:applicationmemoire/services/user.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../screen/livreur.dart';
// import '../screen/restaurent.dart';

// class GetUserType extends StatefulWidget {
//   const GetUserType({Key? key}) : super(key: key);

//   @override
//   State<GetUserType> createState() => _GetUserTypeState();
// }

// class _GetUserTypeState extends State<GetUserType> {
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection('Users');
//     final idUser = FirebaseAuth.instance.currentUser!.uid;
//     return StreamBuilder(
//       stream: users.snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return const Center(
//               child: Text(
//             "Something went wrong",
//             style: TextStyle(color: Colors.black),
//           ));
//         }

//         if (snapshot.hasData) {
//           final user = snapshot.data!.docs
//               .where((element) => element['idUser'] == idUser);

//           if (user!['type'] == 1) {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: ((context) => const Restaurent(title: 'resto'))));
//           }
//           if (user == 2) {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: ((context) => const Livreur())));
//           }
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data = snapshot.data! as Map<String, dynamic>;
//           return Text("Full Name: ${data['nomresto']} ${data['name']}");
//         }

//         return const Center(
//             child: Text("loading",
//                 style: TextStyle(
//                   color: Colors.black,
//                 )));
//       },
//     );
//   }
// }
