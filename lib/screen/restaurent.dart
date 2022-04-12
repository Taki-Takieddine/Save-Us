import 'package:applicationmemoire/auth/login.dart';
import 'package:flutter/material.dart';



class Restaurent extends StatefulWidget {
  const Restaurent({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _Restaurent createState() => _Restaurent();
}

class _Restaurent extends State<Restaurent> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant") ,
      ),


      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
             Color.fromARGB(255, 203, 238, 204),
              Color.fromARGB(255, 53, 119, 174),
              Color.fromARGB(255, 109, 189, 112)
            ]
            )
            ),

            child: Column(
          children: <Widget>[
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(        
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Text("5 Sacs"),
                    ),
                ),
                
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(        
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent.withOpacity(0.2),
                  ),
                  child: Icon(Icons.star_rounded),
                ),
              ],
            ),


            const SizedBox(
                  height: 10,
                ),
            
            Expanded(
                child: Container(
                   width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(60),  
                   ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                  height: 20,
                ),
                    Text("Status des sacs"),  
                    const SizedBox(
                  height: 20,
                ),



                
                    Container(
                                    height: 300,
                                    width: 300,
                                    decoration: BoxDecoration(        
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                                    ),
                    child: SingleChildScrollView(
                      child: Column (
                        children: [
                          Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(        
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                                      ),
                                    ),
                    
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(        
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                                      ),
                                    ),
                    
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(        
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                                      ),
                                    ),
                    
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(        
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                                      ),
                                    ),
                      ]
                      ),
                    ),
                   ),


                   const SizedBox(
                  height: 10,
                ),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       FloatingActionButton(
                         onPressed:() {},
                         tooltip: 'remove',
                         child: Icon(Icons.remove),
                         ),

                         const SizedBox(
                        width: 20,
                ),
                         FloatingActionButton(
                         onPressed:() {},
                         tooltip: 'add',
                         child: Icon(Icons.add),
                         ),
                     ],
                   ),
                     
                  ]
                  ),
               ),
            ),
          ],
         )
      ),
    );
  } 
}