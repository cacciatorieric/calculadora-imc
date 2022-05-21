import 'package:calculadora_imc/components/small_button_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color corPrimaria = Theme.of(context).primaryColor;
    Color corSecundaria = Theme.of(context).scaffoldBackgroundColor;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: corPrimaria,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 215,
                left: 30,
                child: Text(
                  'YouHealthy',
                  style: GoogleFonts.pacifico(
                    color: corSecundaria,
                    fontSize: 35,
                  ),
                ),
              ),
              Positioned(
                top: 285,
                left: 30,
                child: Text(
                  'Calculadora de índice\n de massa corporal',
                  style: GoogleFonts.pacifico(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Positioned(
                top: 380,
                left: 20,
                child: SvgPicture.asset(
                  'assets/images/imagem_splash.svg',
                  width: 300,
                ),
              ),
              const Positioned(
                top: 825,
                left: 310,
                child: SmallBtn(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
