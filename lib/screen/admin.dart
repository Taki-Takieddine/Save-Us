
import 'package:applicationmemoire/models/resto.dart';
import 'package:applicationmemoire/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'navbar.dart';

late final int type;
class Admin extends StatefulWidget {
   const Admin({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<Admin> createState() => _AdminState();
}


class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  const NavBar(),
      appBar: AppBar(
        title: const Center(child: Text('Administrateur')),
        backgroundColor: Colors.purple,
        
        
      ),
      
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                Colors.purple,
                Colors.blueAccent, ]
                   )
                  ),
                  child: Padding(
                    padding:const EdgeInsets  .fromLTRB(10, 20, 10, 20),
                    child: SingleChildScrollView(
                      child: Column(
                      children: [
                    
                        StreamBuilder<QuerySnapshot>(
                      stream:FirebaseFirestore.instance.collection('Users')
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }
                      
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                      
                        return SingleChildScrollView(
                          child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:snapshot.data?.docs.length,
                                   itemBuilder: (BuildContext context, int index) {
                                     if(snapshot.data?.docs[index]['show'] == false) {
                                       return Container(
                                     margin: const EdgeInsets.all(10),
                                   decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 8.0,
                                        spreadRadius: 0.5,
                                      color: Colors.grey,
                                      offset: Offset(0.7, 0.7)
                                    )
                                    ],
                                    ),
                                   child: Padding(
                                     padding: const EdgeInsets.all(10),
                                     child:Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                     
                                        const Text('idUser :',style: TextStyle(color: Color.fromARGB(255, 53, 119, 174,),fontSize: 15,fontWeight: FontWeight.bold),),
                                       
                                       Text((snapshot.data?.docs[index]['idUser']).toString(),style:const TextStyle(color:Color.fromARGB(255, 53, 119, 174,),fontSize: 13),), 
                                        ],
                                        ),
                                         const SizedBox(height: 9,),
                                        Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                     
                                        const Text('Type de compte  :',style: TextStyle(color: Color.fromARGB(255, 53, 119, 174,),fontSize: 15,fontWeight: FontWeight.bold),),
                                       if(snapshot.data?.docs[index]['type']==1)
                                       const Text('Restaurant ',style: TextStyle(color:Color.fromARGB(255, 53, 119, 174,),fontSize: 13),), 
                                       if(snapshot.data?.docs[index]['type']==2)
                                       const Text('Livreur ',style: TextStyle(color:Color.fromARGB(255, 53, 119, 174,),fontSize: 13),), 
                                        ],
                                        ),
                                        const SizedBox(height: 15,),
                                        Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                                           children: [
                                                             GestureDetector(
                                        onTap: () {
                                                               showDialog<void>(
                                                               context: context,
                                                               barrierDismissible: false,
                                                               builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Confirmation du Refus'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                      children: const <Widget>[
                                        Text('Voulez vous vraiment confirmer se refus ?'),
                                      ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                      child: const Text(' Non'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                        ),
                                        TextButton(
                                      child: const Text('Oui'),
                                      onPressed: () {
                                        
                                      },
                                        ),
                                      ],
                                    );
                                                               },
                                   );
                                        },
                                        child: Container(
                                           height: 40,width: 110,
                                          margin: const EdgeInsets.symmetric(horizontal: 20),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        child:  Center(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children:const [
                                              
                                               Text(
                                              "Refuser",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Icon(Icons.clear,color: Colors.white,)
                                            ], 
                                          ),
                                        ),
                                      )),
                                     
                                       GestureDetector(
                                        onTap: () {
                                          showDialog<void>(
                                                               context: context,
                                                               barrierDismissible: false, // user must tap button!
                                                               builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Confirmation'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                      children: const <Widget>[
                                        Text('êtes-vous vraiment sûr de vouloir accepter'),
                                      ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                      child: const Text(' Non'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                        ),
                                        TextButton(
                                      child: const Text('Oui'),
                                      onPressed: () async {
                                        final snapshots = await FirebaseFirestore.instance
                              .collection('Users').where('idUser',isEqualTo: snapshot.data?.docs[index]['idUser'] )
                              .get();
                                        if(snapshot.data?.docs[index]['type']==2){
                                         
                                                            final user=Users(id: ''
                                          , email: snapshots.docs[0]['email']
                                          , type: snapshots.docs[0]['type'],
                                            idUser: snapshots.docs[0]['idUser'],
                                            name: snapshots.docs[0]['name'], 
                                            phoneNumber:snapshots.docs[0]['phoneNumber'],
                                            wilaya: snapshots.docs[0]['wilaya'], 
                                           show:true,);
                                            await FirebaseFirestore.instance
                                          .collection('Users').doc(snapshots.docs[0].id)
                                          .set(user.toMap());
                                        }
                                        if(snapshot.data?.docs[index]['type']==1){
                                          
                                                            final user=Resto(id: ''
                                          , email: snapshots.docs[0]['email']
                                          , type: snapshots.docs[0]['type'],
                                            idUser: snapshots.docs[0]['idUser'],
                                            name: snapshots.docs[0]['name'], 
                                            phoneNumber:snapshots.docs[0]['phoneNumber'],
                                            wilaya: snapshots.docs[0]['wilaya'], adressresto:snapshots.docs[0]['adressresto'], 
                                            nombreDonation:snapshots.docs[0]['nombreDonation'] -1,
                                              nombreDonationTotal:snapshots.docs[0]['nombreDonation'] -1,
                                              nomresto:snapshots.docs[0]['nomresto'],
                                              stars: snapshots.docs[0]['stars'],
                                              show:true,);
                                              await FirebaseFirestore.instance
                                          .collection('Users').doc(snapshots.docs[0].id)
                                          .set(user.toMapResto());
                                        }
                                        Navigator.of(context).pop();
                                        
                                      },
                                        ),
                                      ],
                                    );
                                                               });
                                          
                                        },
                                        child: Container(
                                           height: 40,width: 110,
                                          margin: const EdgeInsets.symmetric(horizontal:30),
                                          decoration: BoxDecoration(
                                            color:const Color.fromARGB(255, 109, 189, 112) ,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        child:  Center(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children:const [
                                             
                                               Text(
                                              "Accepter ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Icon(Icons.done,color: Colors.white,)
                                            ], 
                                          ),
                                        ),
                                      )),
                                      
                                      
                                                           ],
                                                        ),
                                                               
                                      ],
                                     )
                                     
                                   )
                                   );
                                     }
                                     else {
                                       return const Center(child:Text(''),);
                                     }
                                           }
                                         ),
                        );
                      },
                      )
                      ],
                      ),
                    ),
                  ),
                  )));
                    
                      
 }
}