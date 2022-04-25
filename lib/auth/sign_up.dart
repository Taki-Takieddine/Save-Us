import 'package:applicationmemoire/auth/widgets/text_field_sign_up.dart';
import 'package:applicationmemoire/screen/livreur.dart';
import 'package:applicationmemoire/screen/restaurent.dart';
import 'package:applicationmemoire/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../models/resto.dart';
import '../models/user.dart';
import 'login.dart';

class SignUP extends StatelessWidget {
  final int type;
  SignUP({
    Key? key,
    required this.type,
  }) : super(key: key);
  final emailContr = TextEditingController();
  final pwdContr = TextEditingController();
  final nomContr = TextEditingController();
  final wilayaContr = TextEditingController();
  final numtelContr = TextEditingController();
  final nomrestoContr = TextEditingController();
  final adressContr = TextEditingController();
  late final String confirmePWD;
  late final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //conteneur de base
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
              Color.fromARGB(255, 109, 189, 112),
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
                      "Sign Up",
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
                      "un petit slogant dok nkhmem fih tani ",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                 boxShadow: [
                     BoxShadow(
                       blurRadius: 8.0,
                       spreadRadius: 0.5,
                     color: Colors.blueGrey,
                     offset: Offset(0.7, 0.7)
                   )
                  ],
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(60))),
              child: //wrapper
                  Padding(
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
                        child: //input field
                            Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Textfield(
                                controller: nomContr,
                                icon: const Icon(
                                  Icons.arrow_right,
                                  color: Colors.green,
                                ),
                                lable: 'nom',
                                return1: 'nom non valid',
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'wilaya',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.add_location,
                                    color: Colors.green,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Nom invalid';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  wilayaContr.text = value.toString();
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Numéro de téléphone',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.call,
                                    color: Colors.green,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Num invalid';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  numtelContr.text = value.toString();
                                },
                              ),
                              if (type == 1)
                                const SizedBox(
                                  height: 15,
                                ),
                              if (type == 1)
                                Textfield(
                                    lable: 'nom du restaurant',
                                    icon: const Icon(
                                      Icons.arrow_right,
                                      color: Colors.green,
                                    ),
                                    return1: 'nom invalid',
                                    controller: nomrestoContr),
                              if (type == 1)
                                const SizedBox(
                                  height: 15,
                                ),
                              if (type == 1)
                                Textfield(
                                    lable: 'adresse du restaurant',
                                    icon: const Icon(
                                      Icons.add_location,
                                      color: Colors.green,
                                    ),
                                    return1: 'adresse non valid',
                                    controller: adressContr),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'E-mail',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.green,
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
                                height: 15,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Mot de passe',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.password_rounded,
                                      color: Colors.green),
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
                                  //confirmePWD=value;
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Confirmez mot de passe',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.password_rounded,
                                      color: Colors.green),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'mot de passe incorrect';
                                  }
                                  return null;
                                },
                                onSaved: (value) {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                      const SizedBox(
                        height: 40,
                      ),
                      //button signup
                      GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: emailContr.text.trim(),
                                      password: pwdContr.text.trim())
                                  .then((value) {
                                if (type == 1) {
                                  final resto = Resto(
                                    id: '',
                                    type: type,
                                    name: nomContr.text,
                                    phoneNumber: int.parse(numtelContr.text),
                                    wilaya: int.parse(wilayaContr.text),
                                    nomresto: nomrestoContr.text,
                                    adressresto: adressContr.text,
                                    email: emailContr.text,
                                    idUser: value.user!.uid,
                                  );
                                  createResto(resto);
                                }
                                if (type == 2) {
                                  final user = Users(
                                    id: '',
                                    wilaya: int.parse(wilayaContr.text),
                                    type: type,
                                    name: nomContr.text,
                                    phoneNumber: int.parse(numtelContr.text),
                                    email: emailContr.text,
                                    idUser: value.user!.uid,
                                  );
                                  createUser(user);
                                }

                                if (type == 1) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const Restaurent(
                                                title: '',
                                              ))));
                                }
                              });
                              if (type == 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const Livreur())));
                              }
                            } //fnct pour enregistrer les données  tt appart password (9ri firestore m tali )
                          },
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Sign Up",
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

                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'vous avez un compte ?  ',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                  text: 'connectez-vous !',
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
                                              builder: ((context) => LogIn(
                                                    title: '',
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

  Future createUser(Users user) async {
    final docUser = FirebaseFirestore.instance.collection('Users').doc();
    await docUser.set(user.toMap());
  }

  Future createResto(Resto resto) async {
    final docUser = FirebaseFirestore.instance.collection('Users').doc();
    await docUser.set(resto.toMapResto());
  }
}
