import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StandartButton extends StatelessWidget {
  const StandartButton({Key? key, required this.titulo, required this.acao}) : super(key: key);

  final String titulo;
  final void Function() acao;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      child: Text(
        titulo,
        style: GoogleFonts.titilliumWeb(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
      onPressed:acao,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: Size(MediaQuery.of(context).size.width * 0.7, 58),
        onPrimary: Colors.white,
        primary: const Color.fromARGB(255, 53, 75, 52),
        elevation: 6,
      ),
    );
  }
}
