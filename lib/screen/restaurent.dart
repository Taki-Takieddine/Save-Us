


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
 late int nombresac=0;
 int index=0;
  final items=List.generate(50, (counter) => 'Item:$counter');

 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Restaurant") ,
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
                    colors: <Color>[
                  Color.fromARGB(255, 53, 119, 174),
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
                               Text("$nombresac Sacs",style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                               
                         Row(
                           
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Container(
                                decoration:  BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(50),),
                               child: Center(
                                 child:IconButton(
                               onPressed:() {
                                 setState(() {
                                   if(nombresac>0){
                                   nombresac-=1;
                                   }
                                 });
                               }, icon: const Icon(Icons.remove_outlined,color: Color.fromARGB(255, 53, 119, 174),),
                               
                             ),),
                             ),
                             
                               const SizedBox(
                              width: 20,
                      ),
                         Container(
                          
                            decoration:  BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(50)
                           ),
                           child: Center(
                             child: IconButton(
                               onPressed:() {
                                 setState(() {
                                   
                                   nombresac+=1;
                                     final sac = Sac(
                                     id: '', 
                                     dateDepo: DateTime.now(), 
                                     dateLiv:  DateTime.now(), 
                                     idResto:FirebaseAuth.instance.currentUser!.uid, 
                                     statue: true, 
                                     idLivreur: '');
                                    createSac(sac);
                                 });
                               },
                               icon: const Icon(Icons.add,color: Color.fromARGB(255, 53, 119, 174),),
                               ),
                            ),
                         )    
                           ],
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
                  Container(
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
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      const Text("Status des sacs",style: TextStyle(color: Color.fromARGB(255, 53, 119, 174,),fontWeight: FontWeight.bold,fontSize: 30),),  
                      Container(
                                      
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.all(25),

                                              child:Container(
                                                width:MediaQuery.of(context).size.width ,
                                                margin: const EdgeInsets.all(20),
                                                height: 350,
                                                child: const Text('ko n3amrha ki ndir BDD')),
                      )],
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
}
