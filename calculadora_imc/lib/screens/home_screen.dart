import 'package:calculadora_imc/components/inputs/phone_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

TextEditingController pesoController = TextEditingController();
TextEditingController alturaController = TextEditingController();
String? usuario;

class _HomeState extends State<Home> {
  String uid = "";
  @override
  @override
  Widget build(BuildContext context) {
    usuario = 'Usuário(a)';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          'Seja bem vindo $usuario', //$usuario
          style: GoogleFonts.titilliumWeb(
            color: Colors.blue,
            fontSize: 26,
          ),
        ),
        actions: <Widget>[
          Padding(
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
          ),
        ],
      ),
      body: Container(
color: Colors.blueAccent,
        width: double.infinity,
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 100),
        child: Column(
          children: [
            PhoneInput(controller: pesoController, hint: 'oi', largura: MediaQuery.of(context).size.width * 0.2,),
  SizedBox(height: 20, ),

          PhoneInput(controller: alturaController, hint: 'lambe', largura: MediaQuery.of(context).size.width * 0.5)

          ],
        ),
      ),
    );
  }
}
