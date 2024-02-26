import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({ required this.type ,required this.text, required this.controller ,super.key});

  final String text;
  final TextEditingController controller;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        child: TextField(
          keyboardType: type,
          controller: controller,
          style: const TextStyle(fontFamily: 'Roboto',color: Colors.black),
          decoration: InputDecoration(
            labelText: text,
            labelStyle: const TextStyle(color: Color.fromRGBO(24, 56, 131, 1)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
               borderSide: const BorderSide(color: Color.fromRGBO(24, 56, 131, 1), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color.fromRGBO(24, 56, 131, 1), width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
