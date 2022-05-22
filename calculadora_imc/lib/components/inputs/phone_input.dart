import 'package:flutter/material.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({
    Key? key,
    required this.controller,
    required this.hint,
    this.texto,
    this.maxLenght,
    this.tipoInput,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hint;
  final String? texto;
  final int? maxLenght;
  final TextInputType? tipoInput;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.elliptical(12, 12),
          ),
          shape: BoxShape.rectangle),
      child: TextField(
        controller: controller,
        keyboardType: tipoInput,
        decoration: InputDecoration(
          hintText: hint,
          prefix: Padding(
            padding: const EdgeInsets.all(4),
            child: Text(texto!),
          ),
        ),
      ),
    );
  }
}
