          // return SingleChildScrollView(
          //               child: ListView.builder(
          //                   physics: const NeverScrollableScrollPhysics(),
          //                   shrinkWrap: true,
          //                   itemCount: snapshot.data?.docs.length,
          //                   itemBuilder: (BuildContext context, int index) {
          //                     return GestureDetector(
          //                       onTap: () async {
          //                         final signale = snapshot.data?.docs[index].id;
          //                         final snapshots = await FirebaseFirestore
          //                             .instance
          //                             .collection('signalement')
          //                             .doc(signale)
          //                             .get();

          //                         Navigator.push(
          //                             context,
          //                             MaterialPageRoute(
          //                                 builder: ((context) => DetailLivraison(
          //                                     idLivraison: (snapshot
          //                                             .data?.docs[index].id)
          //                                         .toString(),
          //                                     description: (snapshots
          //                                             .data()!['description'])
          //                                         .toString(),
          //                                     nombreSDF: (snapshots
          //                                         .data()!['sdfNumber']),
          //                                     positionX: (snapshots
          //                                             .data()!['positionX'])
          //                                         .toString(),
          //                                     positionY: (snapshots
          //                                             .data()!['positionY'])
          //                                         .toString(),
          //                                     adressSDF: (snapshots
          //                                             .data()!['adressSDF'])
          //                                         .toString()))));
          //                       },
          //                       child: Expanded(
          //                         child: Container(
          //                             height: 85,
          //                             margin: const EdgeInsets.all(10),
          //                             decoration: BoxDecoration(
          //                               color: Colors.white,
          //                               borderRadius: BorderRadius.circular(20),
          //                               boxShadow: const [
          //                                 BoxShadow(
          //                                     blurRadius: 8.0,
          //                                     spreadRadius: 0.5,
          //                                     color: Colors.grey,
          //                                     offset: Offset(0.7, 0.7))
          //                               ],
          //                             ),
          //                             child: Padding(
          //                                 padding: const EdgeInsets.all(10),
          //                                 child: SingleChildScrollView(
          //                                   scrollDirection: Axis.horizontal,
          //                                   child: Row(
          //                                     mainAxisAlignment:
          //                                         MainAxisAlignment
          //                                             .spaceBetween,
          //                                     children: [
          //                                       Column(
          //                                         mainAxisAlignment:
          //                                             MainAxisAlignment
          //                                                 .spaceEvenly,
          //                                         crossAxisAlignment:
          //                                             CrossAxisAlignment.start,
          //                                         children: [
          //                                           Row(
          //                                             children: [
          //                                               const Text(
          //                                                 'Livraison :',
          //                                                 style: TextStyle(
          //                                                     color: Color
          //                                                         .fromARGB(
          //                                                             255,
          //                                                             53,
          //                                                             119,
          //                                                             174),
          //                                                     fontSize: 15,
          //                                                     fontWeight:
          //                                                         FontWeight
          //                                                             .bold),
          //                                               ),
          //                                               const SizedBox(
          //                                                 width: 5,
          //                                               ),
          //                                               Text(
          //                                                 (snapshot
          //                                                         .data
          //                                                         ?.docs[index]
          //                                                         .id)
          //                                                     .toString(),
          //                                                 style:
          //                                                     const TextStyle(
          //                                                         color: Color
          //                                                             .fromARGB(
          //                                                                 255,
          //                                                                 53,
          //                                                                 119,
          //                                                                 174),
          //                                                         fontSize: 13),
          //                                               ),
          //                                             ],
          //                                           ),
          //                                           Row(
          //                                             children: const [
          //                                               Text(
          //                                                 'Adresse du resto:',
          //                                                 style: TextStyle(
          //                                                     color: Color
          //                                                         .fromARGB(
          //                                                             255,
          //                                                             53,
          //                                                             119,
          //                                                             174),
          //                                                     fontSize: 15,
          //                                                     fontWeight:
          //                                                         FontWeight
          //                                                             .bold),
          //                                               ),
          //                                               SizedBox(
          //                                                 width: 5,
          //                                               ),
          //                                               Text(
          //                                                 'jsp nchkl w syi',
          //                                                 style: TextStyle(
          //                                                     color: Color
          //                                                         .fromARGB(
          //                                                             255,
          //                                                             53,
          //                                                             119,
          //                                                             174),
          //                                                     fontSize: 13),
          //                                               ),
          //                                             ],
          //                                           ),
          //                                           SingleChildScrollView(
          //                                             scrollDirection:
          //                                                 Axis.horizontal,
          //                                             child: Row(
          //                                               children: [
          //                                                 const Text(
          //                                                   'Adresse du SDF:',
          //                                                   style: TextStyle(
          //                                                       color: Color
          //                                                           .fromARGB(
          //                                                               255,
          //                                                               53,
          //                                                               119,
          //                                                               174),
          //                                                       fontSize: 15,
          //                                                       fontWeight:
          //                                                           FontWeight
          //                                                               .bold),
          //                                                 ),
          //                                                 const SizedBox(
          //                                                   width: 5,
          //                                                 ),
          //                                                 Text(
          //                                                   (snapshot.data!.docs[
          //                                                               index][
          //                                                           'adressSDF'])
          //                                                       .toString(),
          //                                                   overflow:
          //                                                       TextOverflow
          //                                                           .ellipsis,
          //                                                   softWrap: false,
          //                                                   style: const TextStyle(
          //                                                       color: Color
          //                                                           .fromARGB(
          //                                                               255,
          //                                                               53,
          //                                                               119,
          //                                                               174),
          //                                                       fontSize: 13),
          //                                                 ),
          //                                               ],
          //                                             ),
          //                                           ),
          //                                         ],
          //                                       ),
          //                                       const Icon(
          //                                         Icons.arrow_right,
          //                                         color: Colors.purple,
          //                                         size: 35,
          //                                       )
          //                                     ],
          //                                   ),
          //                                 ))),
          //                       ),
          //                     );
          //                   }),
          //             );