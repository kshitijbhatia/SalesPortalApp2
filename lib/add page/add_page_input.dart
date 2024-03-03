import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField(
      {required this.errorText,
      required this.type,
      required this.text,
      required this.controller,
      super.key});

  final String text;
  final TextEditingController controller;
  final TextInputType type;
  final String? errorText;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: 350,
            child: TextField(
              keyboardType: widget.type,
              style: const TextStyle(fontFamily: 'Roboto', color: Colors.black),
              controller: widget.controller,
              decoration: InputDecoration(
                labelText: widget.text,
                labelStyle: const TextStyle(
                    fontFamily: 'Roboto',
                    color: Color.fromRGBO(28, 28, 28, 0.8)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(24, 56, 131, 1), width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(24, 56, 131, 1), width: 2),
                ),
                errorText: widget.errorText,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
