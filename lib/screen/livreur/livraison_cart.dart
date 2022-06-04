import 'package:applicationmemoire/screen/detail_livraison.dart';
import 'package:applicationmemoire/screen/livreur/livraison.dart';
import 'package:flutter/material.dart';


class LivraisonCart extends StatelessWidget {
  const LivraisonCart({
    Key? key,
    required this.livraison,
  }) : super(key: key);

  final Livraison livraison;


  @override
  Widget build(BuildContext context) {
     return GestureDetector(
                                onTap: () async {

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => DetailLivraison(Liv: livraison,
                                            ))));
                                },
                                child: Expanded(
                                  child: Container(
                                      height: 85,
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 8.0,
                                              spreadRadius: 0.5,
                                              color: Colors.grey,
                                              offset: Offset(0.7, 0.7))
                                        ],
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    
                                                    Row(
                                                      children: [
                                                        const Text(
                                                          'Adresse du resto:',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      53,
                                                                      119,
                                                                      174),
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          livraison.resto.adressresto.toString(),
                                                          style: const TextStyle(
                                                              color:  Color
                                                                  .fromARGB(
                                                                      255,
                                                                      53,
                                                                      119,
                                                                      174),
                                                              fontSize: 13),
                                                        ),
                                                      ],
                                                    ),
                                                    SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        children: [
                                                          const Text(
                                                            'Adresse du SDF:',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        53,
                                                                        119,
                                                                        174),
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            livraison.signalement.adressSDF.toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            softWrap: false,
                                                            style: const TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        53,
                                                                        119,
                                                                        174),
                                                                fontSize: 13),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Icon(
                                                  Icons.arrow_right,
                                                  color: Colors.purple,
                                                  size: 35,
                                                )
                                              ],
                                            ),
                                          ))),
                                ),
                              );
    // ListTile(
    //   title: const Text("hedi hiya la livrason la plus proche"),
    //   subtitle: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(livraison.resto.adressresto),
    //       Text(livraison.signalement.description),
    //     ],
    //   ),
    //   onTap: () {
    //    
    //   },
  
  }
}
