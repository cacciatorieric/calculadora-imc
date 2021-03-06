import 'package:calculadora_imc/components/box/caixas.dart';
import 'package:calculadora_imc/components/buttons/standart_button.dart';
import 'package:calculadora_imc/components/inputs/phone_input.dart';
import 'package:calculadora_imc/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User? user;
  String verificationID = "";

  @override
  Widget build(BuildContext context) {
    Color corPrimaria = const Color.fromARGB(255, 53, 75, 52);
    Color corSecundaria = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 240, 255, 238),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 150,
            ),
            Text(
              'YouHealthy',
              style: GoogleFonts.pacifico(
                color: corPrimaria,
                fontSize: 35,
              ),
            ),
            Text(
              'Calculadora IMC',
              style: GoogleFonts.titilliumWeb(
                color: Colors.black45,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'LOGIN',
              style: GoogleFonts.titilliumWeb(
                  color: corPrimaria,
                  fontSize: 30,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 80,
            ),
            PhoneInput(
              controller: phoneController,
              hint: 'Insira seu n??mero aqui',
              largura: MediaQuery.of(context).size.width * 0.7,
              maxLenght: 11,
              bandeira: SvgPicture.asset(
                'assets/images/bandeirola.svg',
                height: 20,
              ),
              tipoInput: TextInputType.phone,
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              child: PhoneInput(
                controller: otpController,
                largura: MediaQuery.of(context).size.width * 0.7,
                hint: 'Digite o c??digo aqui',
                maxLenght: 6,
                tipoInput: const TextInputType.numberWithOptions(),
              ),
              visible: otpVisibility,
            ),
            const SizedBox(
              height: 10,
            ),
            StandartButton(
              titulo: 'Avan??ar',
              acao: () {
                if (otpVisibility) {
                  verifyOTP();
                } else {
                  loginWithPhone();
                }
                otpVisibility ? "Verificar" : "Avan??ar";
              },
            ),
            const SizedBox(
              height: 150,
            ),
            Text(
              'Ou fa??a seu login com',
              style: GoogleFonts.titilliumWeb(
                color: Colors.black45,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const CaixaGenerica(),
          ],
        ),
      ),
    );
  }

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+55" + phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          debugPrint("Seja bem vindo ao meu portif??lio");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        debugPrint(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then(
      (value) {
        setState(() {
          user = FirebaseAuth.instance.currentUser;
        });
      },
    ).whenComplete(
      () {
        if (user != null) {
          Fluttertoast.showToast(
            msg: "Seja bem vindo ao meu portif??lio",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        } else {
          Fluttertoast.showToast(
            msg: "Codigo incorreto, verifique e tente novamente",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );
  }
}
