import 'package:calculadora_imc/components/appbar/custom_appbar.dart';
import 'package:calculadora_imc/components/charts/grafico_medidor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

TextEditingController pesoController = TextEditingController();
TextEditingController alturaController = TextEditingController();
String? usuario;
double? valorImc;

class _HomeState extends State<Home> {
  String uid = "";
  @override
  @override
  Widget build(BuildContext context) {
    usuario = 'Usuário(a)';
    valorImc = 52;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          'Seja bem vindo $usuario', 
          style: GoogleFonts.titilliumWeb(
            color: Colors.red,
            fontSize: 16,
          ),
        ),
        actions: const <Widget>[
          CustomAppBar(),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: GraficoMedidor(valorCalculo: valorImc),
      ),
    );
  }
}
