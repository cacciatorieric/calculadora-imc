import 'dart:ffi';

import 'package:calculadora_imc/components/charts/seta_dinamica.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
    valorImc = 10;
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
        color: const Color.fromARGB(255, 255, 255, 255),
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 60,
              interval: 5,
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 0,
                  endValue: 18.4,
                  color: Colors.blue,
                  label: 'Abaixo do ideal',
                ),
                GaugeRange(
                  startValue: 18.5,
                  endValue: 24.9,
                  color: Colors.green,
                  label: 'Peso ideal',
                ),
                GaugeRange(
                  startValue: 25,
                  endValue: 29.9,
                  color: const Color.fromARGB(255, 254, 131, 0),
                  label: 'Sobrepeso',
                ),
                GaugeRange(
                  startValue: 30,
                  endValue: 39.9,
                  color: Colors.red,
                  label: 'Obesidade Grau I e II',
                ),
                GaugeRange(
                  startValue: 40,
                  endValue: 60,
                  color: const Color.fromARGB(255, 53, 1, 1),
                  label: 'Obesidade Grau III',
                ),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: valorImc!,
                  enableAnimation: true,
                )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: SetaDinamica(valor: valorImc),
                  positionFactor: 0.2,
                  angle: 90,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
