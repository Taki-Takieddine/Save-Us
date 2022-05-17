


import 'package:applicationmemoire/models/resto.dart';
import 'package:applicationmemoire/screen/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/sac.dart';


class Restaurent extends StatefulWidget {
   const Restaurent({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _Restaurent createState() => _Restaurent();
}

class _Restaurent extends State<Restaurent> {

  String idResto= FirebaseAuth.instance.currentUser!.uid;
  var userInfo=FirebaseFirestore.instance
        .collection('Users').where('idUser',isEqualTo:FirebaseAuth.instance.currentUser!.uid);
 int index=0;
var nbsac=0;
getNombreDonation()async{
  final snapshot=await userInfo.get();
 nbsac=snapshot.docs[0]['nombreDonation'];
}
@override
  void initState() {
    getNombreDonation();
    super.initState();
  }
  final items=List.generate(50, (counter) => 'Item:$counter');
 @override
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer:const NavBar(),
        appBar: AppBar(
          title: const Center(child: Text("Restaurant")) ,
          backgroundColor: const Color.fromARGB(255, 53, 119, 174),
        ),
    
    
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Color.fromARGB(255, 53, 119, 174),
                  
                  Color.fromARGB(255, 109, 189, 112)
                ]
                )
                ),
        
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(        
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent.withOpacity(0.2),
                          ),
                          child:  Center(
                            child: Column(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                               Text("$nbsac Sacs",style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                               
                         const SizedBox(
                              width: 20,
                      ),
                         Container(
                            width: 80,
                            decoration:  BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(50)
                           ),
                           child: Center(
                             child: IconButton(
                         onPressed:()async {
                               final snapshot = await FirebaseFirestore.instance
                              .collection('Users').where( 'idUser' ,isEqualTo: idResto)
                              .get();
                               final
                               adresse=snapshot.docs[0]['adressresto'];
                               final sac = Sac(
                               dateDepo: DateTime.now(), 
                               dateLiv:  DateTime.now(), 
                               idResto:FirebaseAuth.instance.currentUser!.uid, 
                               statue: true, 
                               idLivreur: '', id: '', adresseResto:adresse);
                               createSac(sac);  
                              
                               final user=Resto(id: ''
                               , email: snapshot.docs[0]['email']
                               , type: snapshot.docs[0]['type'],
                                idUser: snapshot.docs[0]['idUser'],
                                 name: snapshot.docs[0]['name'], 
                                 phoneNumber:snapshot.docs[0]['phoneNumber'],
                                 wilaya: snapshot.docs[0]['wilaya'], adressresto: '', 
                                 nombreDonation:snapshot.docs[0]['nombreDonation'] +1,
                                  nombreDonationTotal:snapshot.docs[0]['nombreDonation'] +1,
                                  nomresto:snapshot.docs[0]['nomresto'],
                                   stars: snapshot.docs[0]['stars']);
                                   await FirebaseFirestore.instance
                              .collection('Users').doc(snapshot.docs[0].id)
                              .set(user.toMapResto());
                                setState(() {
                                  getNombreDonation();
                                }); 
                              
                    
                         },
                         icon: const Icon(Icons.add,color: Color.fromARGB(255, 53, 119, 174),),
                         ),
                            ),
                         ),
                             ], ),
                        ),
                      ),
                      ),
                       Expanded(
                        child: Container(
                      
                           margin: const EdgeInsets.all(15),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(        
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent.withOpacity(0.2),
                          ),
                          child: const Icon(Icons.star_rounded ,color: Colors.white,size: 50,),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Container(
                       width: MediaQuery.of(context).size.width,
                       height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                         boxShadow: [
                       BoxShadow(
                         blurRadius: 8.0,
                         spreadRadius: 0.5,
                       color: Colors.black,
                       offset: Offset(0.5, 0.5)
                     )
                    ],
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(60),  
                       ),
                    ),
                    child:Column(
                      children: [
                       
                       const SizedBox(height: 10,),
                       const Text("Status des sacs",style: TextStyle(color: Color.fromARGB(255, 53, 119, 174,),fontWeight: FontWeight.bold,fontSize: 30),),  
                        StreamBuilder<QuerySnapshot>(
                    stream:FirebaseFirestore.instance.collection('sac')
                        .where('idResto',isEqualTo:idResto).snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }
                    
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                    
                      return Expanded(
                        child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:snapshot.data?.docs.length,
                                 itemBuilder: (BuildContext context, int index) {
                                 return Padding(
                                   padding:const EdgeInsets.all(12),
                                   child: Container(
                                     height: 65,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(1),
                                      borderRadius:BorderRadius.circular(30),
                                       boxShadow:const [
                                        BoxShadow(
                                          blurRadius: 8.0,
                                          spreadRadius: 0.5,
                                        color: Colors.blueGrey,
                                        offset: Offset(0.8, 0.5)
                                      )
                                      ],
                                    ),
                                    child:Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: 
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Row(
                                                children:[
                                                  const Icon(Icons.circle,color: Color.fromARGB(255, 53, 119, 174,) ,size: 8,),
                                                  const  Text('ID du sac :',style: TextStyle(color: Color.fromARGB(255, 53, 119, 174,),fontWeight: FontWeight.bold,fontSize: 15),),
                                                 const SizedBox(width: 5,),
                                                 
                                                  Text((snapshot.data?.docs[index].id).toString(),style: const TextStyle(color:  Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 13),), 
                                                ],
                                              ),
                                              const SizedBox(height: 5,),
                                              Row(
                                                children:  [
                                                  if(snapshot.data?.docs[index]['statue']==true)
                                                  const Icon(Icons.circle,color: Colors.green ,size: 10,),
                                                   if(snapshot.data?.docs[index]['statue']==false) const Icon(Icons.circle,color: Colors.orange ,size: 10,),const  SizedBox(width: 10,),
                                               const Text('Statue du sac :',style: TextStyle(color: Color.fromARGB(255, 53, 119, 174,),fontWeight: FontWeight.bold,fontSize: 15),),
                                                
                                                
                                                Text((snapshot.data?.docs[index]['statue']).toString(),style: const TextStyle(color:  Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 13)),
                                                ],
                                              ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 60,),
                                                 GestureDetector(
                                                onTap: ()async{
                                                  if(snapshot.data?.docs[index]['statue']==true){
                                                 await FirebaseFirestore.instance.collection('sac').doc(snapshot.data?.docs[index].id).delete();
                                                 final snapshots = await FirebaseFirestore.instance
                              .collection('Users').where( 'idUser' ,isEqualTo: idResto)
                              .get();
                                                            final user=Resto(id: ''
                                          , email: snapshots.docs[0]['email']
                                          , type: snapshots.docs[0]['type'],
                                            idUser: snapshots.docs[0]['idUser'],
                                            name: snapshots.docs[0]['name'], 
                                            phoneNumber:snapshots.docs[0]['phoneNumber'],
                                            wilaya: snapshots.docs[0]['wilaya'], adressresto: '', 
                                            nombreDonation:snapshots.docs[0]['nombreDonation'] -1,
                                              nombreDonationTotal:snapshots.docs[0]['nombreDonation'] -1,
                                              nomresto:snapshots.docs[0]['nomresto'],
                                              stars: snapshots.docs[0]['stars']);
                                              await FirebaseFirestore.instance
                                          .collection('Users').doc(snapshots.docs[0].id)
                                          .set(user.toMapResto());
                                                 setState(() {
                                                   getNombreDonation();
                                                 });
                                                  }
                                                  else{
                                                   showDialog<void>(
                                                  context: context,
                                                  barrierDismissible: false, // user must tap button!
                                                  builder: (BuildContext context) {
                                                    return  AlertDialog(
                                                    title: const Text('Erreur'),
                                                      content: SingleChildScrollView(
                                                        child: ListBody(
                                                          children: const <Widget>[
                                                            Text('veuillez sélectionner un sac disponible !'),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: const Text(' ok'),
                                                          onPressed: () {
                                                            Navigator.push(context, MaterialPageRoute(builder: ((context) =>
                                                            const Restaurent(title: ''))));

                                                          },
                                                        ),
                                                      
                                                      ],
                                                    );
          
      
      
    },
  );
                                                  }
                                               
                                                },
                                                child:const Icon(Icons.delete,color: Color.fromARGB(255, 53, 119, 174,)) ,) 
                                                ],
                                                
                                              )

                                            
                                            ],
                                          ),
                                      
                                    ),
                                     ),
                                 );
                                 }),
                      );
                    },
                    )]
                      ),
                       ),
                  ),
                    ],
                  ),
                )
          ),
        ),
      ),
    );
    
  } 
  Future createSac(Sac sac) async {
    final docsac = FirebaseFirestore.instance.collection('sac').doc();
    await docsac.set(sac.toMapSac());
  }
  

Future getTypeUser(String idUser) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Users').where( idUser)
        .get();
    return snapshot.docs[0]['type'];
  }
  Future getAdresseUser(String idUser) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Users').where( 'idUser' ,isEqualTo: idResto)
        .get();
    return snapshot.docs[0]['adressresto'];
  }
}

 
