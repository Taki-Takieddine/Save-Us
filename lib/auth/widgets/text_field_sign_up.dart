import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final String lable;
  final Icon icon;
  final String return1;
  const Textfield({
    Key? key,
    required this.lable,
    required this.icon,
    required this.return1,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: lable,
        border: const OutlineInputBorder(),
        prefixIcon: icon,
        labelStyle: const TextStyle(
          fontSize: 15.0,
        ),
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return return1;
        }
        return null;
      },
      onSaved: (value) {
        controller.text = value!;
      },
    );
  }
}
