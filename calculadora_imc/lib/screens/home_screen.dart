import 'package:calculadora_imc/components/appbar/custom_appbar.dart';
import 'package:calculadora_imc/components/charts/grafico_medidor.dart';
import 'package:flutter/material.dart';
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
    valorImc = 17;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const Text(
              'Testando',
              style: TextStyle(fontSize: 25, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Container(
              height: 280,
              width: double.infinity,
              child: GraficoMedidor(
                valorCalculo: valorImc,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
