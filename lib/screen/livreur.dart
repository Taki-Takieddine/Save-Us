

import 'package:applicationmemoire/screen/detail_livraison.dart';
import 'package:flutter/material.dart';

late final int type;
class Livreur extends StatefulWidget {
  const Livreur({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Livreur> createState() => _LivreurState();
}

class _LivreurState extends State<Livreur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livreur'),
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
                    child: ListView(
                     children:[
                       contenaireLivraison(context),
                       const SizedBox(height: 10,),
                      contenaireLivraison(context),
                       const SizedBox(height: 10,),
                       contenaireLivraison(context),
                       const SizedBox(height: 10,),
                       contenaireLivraison(context),
                       const SizedBox(height: 10,),
                       contenaireLivraison(context),
                       const SizedBox(height: 10,),
                       contenaireLivraison(context),
                       const SizedBox(height: 10,),
                       contenaireLivraison(context),
                       const SizedBox(height: 10,),
                       contenaireLivraison(context),
                       const SizedBox(height: 10,),
                       contenaireLivraison(context),
                       const SizedBox(height: 10,),
                     ],
                    ),
                  ),
                 )
                )
               );
              }

  GestureDetector contenaireLivraison(BuildContext context) {
    return GestureDetector(
                       onTap: () {
                         Navigator.push(
                      context, MaterialPageRoute(builder: ((context) =>DetailLivraison())));
                        },
                         child: Container(
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
                           child:Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                              children: const[
                               Text('Livraison :',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                               SizedBox(width: 5,),
                                Text('gsysussncchuid' ,style: TextStyle(color: Colors.grey,fontSize: 13),),
                              ],
                              ),
                              Row(
                              children: const[
                               Text('Adresse du resto:',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                               SizedBox(width: 5,),
                                Text('jsp nchkl w syi' ,style: TextStyle(color: Colors.grey,fontSize: 13),),
                              ],
                              ),
                              Row(
                              children: const[
                               Text('Adresse du SDF:',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                               SizedBox(width: 5,),
                                Text('meme hna ghdi nchkel hihi' ,style: TextStyle(color: Colors.grey,fontSize: 13),),
                              ],
                              ),
                            ],
                           ),
                             const Icon(Icons.arrow_right,color: Colors.purple,size: 35,)
                             ],
                           )
                         )
                         ),
                     );
  }
             }
