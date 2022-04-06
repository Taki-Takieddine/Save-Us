import 'package:flutter/material.dart';

class InputFeild extends StatelessWidget {
  const InputFeild({Key? key}) : super(key: key);

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
                labelText: 'E-mail',
                border: OutlineInputBorder(),
                prefixIcon:   Icon(Icons.email,color: Colors.purple,),
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
          const  SizedBox(height: 30,),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password',border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent,
                ),
               
              ),
              
              prefixIcon:   Icon(Icons.password_rounded, color: Colors.purple),),
              
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
