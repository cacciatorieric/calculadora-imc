import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 25),
      child: GestureDetector(
        child: const CircleAvatar(
          radius: 48,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          backgroundImage: NetworkImage(
            'https://static1.purepeople.com.br/articles/6/28/32/46/@/3217222-como-cuidar-da-pele-do-jeito-certo-em-20-624x600-2.jpg',
          ),
        ),
        onTap: () {
          Fluttertoast.showToast(
            msg:
                'Estou trabalhando no menu lateral e configuração de perfis, fique atendo as novidades nas próximas atualizações',
            backgroundColor: const Color.fromARGB(255, 53, 75, 52),
            textColor: Colors.white,
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 1,
            gravity: ToastGravity.BOTTOM,
            fontSize: 16,
          );
        },
      ),
    );
  }
}
