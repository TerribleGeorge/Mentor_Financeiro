import 'package:flutter/material.dart';

class CampoCustomizado extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Color corLabel;
  final TextInputType teclado;

  const CampoCustomizado({
    super.key,
    required this.controller,
    required this.label,
    this.corLabel = Colors.blueGrey,
    this.teclado = TextInputType.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        keyboardType: teclado,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: corLabel),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
        ),
      ),
    );
  }
}
