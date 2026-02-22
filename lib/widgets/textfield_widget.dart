import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final TextInputType? teclado;

  const TextfieldWidget({
    super.key,
    required this.text,
    this.controller,
    this.teclado,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: .center,
      child: TextFormField(
        key: key,
        keyboardType: teclado,
        controller: controller,
        decoration: InputDecoration(
          label: Text(text, style: TextStyle(color: Colors.grey[600])),
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Campo obrigatório";
          }
          return null;
        },
      ),
    );
  }
}
