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
    valorImc = 31;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 54,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: GroupButton(
                isRadio: true,
                buttons: const ['Feminino', 'Masculino'],
                options: GroupButtonOptions(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(
              height: 46,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    const SizedBox(
                      width: 150,
                      child: Text(
                        'Altura(cm)',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    PhoneInput(
                      controller: pesoController,
                      hint: 'Ex: 170',
                      largura: 150,
                      maxLenght: 3,
                      tipoInput: TextInputType.number,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
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
                      maxLenght: 3,
                      tipoInput: TextInputType.number,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 60,),
            StandartButton(
              titulo: 'Novo monitor',
              acao: () {},
            ),
            GraficoMedidor(
              valorCalculo: valorImc,
            ),
          ],
        ),
      ),
    );
  }
}
