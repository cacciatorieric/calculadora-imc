import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(children: [
          const SizedBox(
            height: 180,
          ),
          const Text(
            'Meu portifolio',
            style: TextStyle(color: Colors.blueAccent, fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          SvgPicture.asset(
            'assets/images/eu.svg',
            width: 300,
          ),
        ]),
      ),
    );
  }
}
