import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField(
      {super.key, required this.controller, required this.label, this.type});

  final TextEditingController controller;
  final String label;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type ?? TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
