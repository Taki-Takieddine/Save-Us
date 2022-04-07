import 'package:flutter/material.dart';

class InputFeildsu extends StatelessWidget {
  const InputFeildsu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nom ',
                border: OutlineInputBorder(),
                prefixIcon:   Icon(Icons.arrow_right,color: Colors.green,),
                labelStyle: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Nom invalid';
                }
                return null;
              },
              onSaved: (value) {
                
              },
            ),
            const  SizedBox(height: 15,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'wilaya',
                border: OutlineInputBorder(),
                prefixIcon:   Icon(Icons.add_location,color: Colors.green,),
                labelStyle: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Nom invalid';
                }
                return null;
              },
              onSaved: (value) {
                
              },
            ),
              const  SizedBox(height: 15,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Numéro de téléphone',
                border: OutlineInputBorder(),
                prefixIcon:   Icon(Icons.call,color: Colors.green,),
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
                
              },
            ),
             const  SizedBox(height: 15,),
             TextFormField(
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
                prefixIcon:   Icon(Icons.email,color: Colors.green,),
                labelStyle: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty  && value.contains('@')) {
                  return 'Email invalid';
                }
                return null;
              },
              onSaved: (value) {
                
              },
            ),
          const  SizedBox(height: 15,),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Mot de passe',border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent,
                ),
               
              ),
              
              prefixIcon:   Icon(Icons.password_rounded, color: Colors.green),),
              
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty && value.length < 6) {
                  return 'mot de passe trop court!';
                }
                return null;
              },
              onSaved: (value) {
               
              },
            ),
            const  SizedBox(height: 15,),
             TextFormField(
              decoration: const InputDecoration(labelText: 'Confirmez mot de passe',border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent,
                ),
               
              ),
              
              prefixIcon:   Icon(Icons.password_rounded, color: Colors.green),),
              
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty && value.length < 6) {
                  return 'mot de passe trop court!';
                }
                return null;
              },
              onSaved: (value) {
               
              },
            ),
          ],
        ),
      );
      }}
