


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
 late int nombresac=0;
  var idResto= FirebaseAuth.instance.currentUser!.uid;
 int index=0;
  final items=List.generate(50, (counter) => 'Item:$counter');
  
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
                                 setState(() async {
                                   if(nombresac>0){
                                   nombresac-=1;
  
                                    }
                                
                                    }  
                                                          
                                 );
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
                                  
                                     dateDepo: DateTime.now(), 
                                     dateLiv:  DateTime.now(), 
                                     idResto:FirebaseAuth.instance.currentUser!.uid, 
                                     statue: true, 
                                     idLivreur: '', id: '');
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
                        .where('idResto',isEqualTo:idResto ).snapshots(),
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
                                                children:[
                                                  const Icon(Icons.circle,color: Color.fromARGB(255, 53, 119, 174,) ,size: 8,),
                                                  const  Text('ID du sac :',style: TextStyle(color: Color.fromARGB(255, 53, 119, 174,),fontWeight: FontWeight.bold,fontSize: 15),),
                                                 const SizedBox(width: 5,),
                                                 
                                                  Text((snapshot.data?.docs[index].id).toString(),style: const TextStyle(color:  Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 13),), 
                                                ],
                                              ),
                                              const SizedBox(height: 5,),
                                              GestureDetector(
                                                onTap: ()async{
                                                  
                                                await FirebaseFirestore.instance.collection('sac').doc(snapshot.data?.docs[index].id).delete();
                                              
                                                },
                                                child: Row(
                                                  children:  [
                                                    const Icon(Icons.circle,color: Color.fromARGB(255, 53, 119, 174,) ,size: 8,),
                                                 const Text('Statue du sac :',style: TextStyle(color: Color.fromARGB(255, 53, 119, 174,),fontWeight: FontWeight.bold,fontSize: 15),),
                                                  
                                                  const  SizedBox(width: 5,),
                                                  Text((snapshot.data?.docs[index]['statue']).toString(),style: const TextStyle(color:  Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 13)),
                                                  ],
                                                ),
                                              ),
                                            
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
  
 
}
