import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({
    Key? key,
    required this.controller,
    required this.hint,
    this.bandeira,
    this.maxLenght,
    this.tipoInput,
    required this.largura,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hint;
  final SvgPicture? bandeira;
  final int? maxLenght;
  final TextInputType? tipoInput;
  final double? largura;

  @override
  Widget build(BuildContext context) {
    Color corPrimaria = Theme.of(context).primaryColor;
    Color corSecundaria = Theme.of(context).scaffoldBackgroundColor;
    return Container(
      width: largura,
      height: 58,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.elliptical(12, 12),
          ),
          shape: BoxShape.rectangle),
      child: TextField(
        controller: controller,
        keyboardType: tipoInput,
        decoration: InputDecoration(
          counterStyle: const TextStyle(height: 0),
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: corSecundaria,
            ),
          ),
          hintText: hint,
          hintStyle: GoogleFonts.titilliumWeb(
            color: Colors.black45,
          ),
          prefix: Padding(
            padding: const EdgeInsets.only(right: 12, bottom: 0, top: 23),
            child: bandeira,
          ),
        ),
        maxLength: maxLenght,
      ),
    );
  }
}
