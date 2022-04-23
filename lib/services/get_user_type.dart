
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'user.dart';
import '../screen/livreur.dart';
import '../screen/restaurent.dart';

class GetUserType extends StatefulWidget {
    @override
  State<GetUserType> createState() => _GetUserTypeState();
  
}

class _GetUserTypeState extends State<GetUserType> {
 final idUser=FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    
    return StreamBuilder<QuerySnapshot>(
      stream: users.where('idUser',isEqualTo: idUser).snapshots(),
      builder:
      
          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          
        
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong",style:TextStyle(color: Colors.black),));
        }

        if (snapshot.hasData) {
          
           if(snapshot.data]==1) {
            Navigator.push(
          context,
           MaterialPageRoute(builder: ((context) =>  const Restaurent(title: 'resto'))));
          }
          if(snapshot.data!['type']==2) {
            Navigator.push(
          context,
           MaterialPageRoute(builder: ((context) => const Livreur())));
          }
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!as Map<String, dynamic>;
          return Text("Full Name: ${data['nomresto']} ${data['name']}");
        }

        return const Center(child: Text("loading",style:TextStyle(color: Colors.black,)));
      },
    );
  }
}