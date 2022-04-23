import 'package:applicationmemoire/auth/sign_up.dart';
import 'package:applicationmemoire/screen/livreur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../screen/restaurent.dart';

class LogIn extends StatelessWidget {
  final emailContr = TextEditingController();
  final pwdContr = TextEditingController();
  late final _formKey = GlobalKey<FormState>();
  late final int type;

  LogIn({Key? key, required String title, required this.type})
      : super(key: key);

  void dispose() {
    emailContr.dispose();
    pwdContr.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
              Color.fromARGB(255, 217, 47, 247),
              Color.fromARGB(255, 53, 119, 174),
              Color.fromARGB(255, 109, 189, 112)
            ])),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            //header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: const <Widget>[
                  Center(
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      "un petit slogant dok nkhmem fih ",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            //wrapper
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(60))),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        //input field
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                controller: emailContr,
                                decoration: const InputDecoration(
                                  labelText: 'E-mail',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.purple,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty && value.contains('@')) {
                                    return 'Email invalid';
                                  }

                                  return null;
                                },
                                onSaved: (value) {
                                  emailContr.text = value!;
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: pwdContr,
                                decoration: const InputDecoration(
                                  labelText: 'Mot de passe',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.password_rounded,
                                      color: Colors.purple),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty && value.length < 6) {
                                    return 'mot de passe trop court!';
                                  }

                                  return null;
                                },
                                onSaved: (value) {
                                  pwdContr.text = value!;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "mot de passe oublié ?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                          onTap: () {
                            logIN().then((value) async {
                              final typeUser =
                                  await getTypeUser(value.user!.uid);
                              if (typeUser == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const Restaurent(title: 'resto'))));
                              }
                              if (typeUser == 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const Livreur())));
                              }
                            });
                          },
                          //button
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 176, 51, 198),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      //switch too signUp
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'vous avez un compte ?  ',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                  text: 'rejoignez-nous !',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) => SignUP(
                                                    type: type,
                                                  ))));
                                    })
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Future getTypeUser(String idUser) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('idUser', isEqualTo: idUser)
        .get();
    return snapshot.docs[0]['type'];
  }

  Future<UserCredential> logIN() async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailContr.text.trim(), password: pwdContr.text.trim());
  }
}
