import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              const Text('Seja bem vindo'),
              const SizedBox(height: 25),
              Positioned(
                top: 250,
                left: 10,
                child: SvgPicture.asset('assets/images/fundo_splash.svg',
                    width: 300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
