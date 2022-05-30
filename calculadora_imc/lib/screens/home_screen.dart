import 'package:calculadora_imc/components/appbar/custom_appbar.dart';
import 'package:calculadora_imc/components/buttons/standart_button.dart';
import 'package:calculadora_imc/components/charts/grafico_medidor.dart';
import 'package:calculadora_imc/components/inputs/phone_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String uid = "";
  String? usuario = 'Usuário(a)';
  double imcCalculo = 0;
  String? imcFormatado;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    imcFormatado = imcCalculo.toStringAsFixed(2);
    return Scaffold(
      //resizeToAvoidBottomInset: false,
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 54,
              ),
              GroupButton(
                isRadio: true,
                buttons: const ['Feminino', 'Masculino'],
                options: GroupButtonOptions(
                  borderRadius: BorderRadius.circular(12),
                  elevation: 4,
                  unselectedColor: Colors.black12,
                  selectedColor: const Color.fromARGB(255, 53, 75, 52),
                ),
              ),
              const SizedBox(
                height: 46,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    'Altura(cm)',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 11,
                    ),
                  ),
                  PhoneInput(
                    controller: alturaController,
                    hint: 'Ex: 170',
                    largura: 150,
                    maxLenght: 4,
                    tipoInput: TextInputType.number,
                  ),
                ]),
                Column(children: [
                  const SizedBox(
                    width: 150,
                    child: Text(
                      'Peso(kg)',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  PhoneInput(
                    controller: pesoController,
                    hint: 'Ex: 90',
                    largura: 150,
                    maxLenght: 4,
                    tipoInput: TextInputType.number,
                  ),
                ]),
              ]),
              Padding(
                padding: const EdgeInsets.only(
                  left: 82.0,
                  right: 82.0,
                  top: 12.0,
                  bottom: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Idade',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 11,
                      ),
                    ),
                    PhoneInput(
                      hint: 'Ex: 28',
                      largura: double.infinity,
                    ),
                  ],
                ),
              ),
              StandartButton(
                titulo: 'Calcular IMC',
                acao: () {
                  setState(
                    () {
                      double pesoImc = double.parse(pesoController.text);
                      double alturaImc = double.parse(alturaController.text);
                      imcCalculo = (pesoImc / (alturaImc * alturaImc)) * 10000;
                    },
                  );
                },
              ),
              GraficoMedidor(
                valorCalculo: double.parse(imcFormatado!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
