import 'package:calculadora_imc/firebase_options.dart';
import 'package:calculadora_imc/screens/login_screen.dart';
import 'package:calculadora_imc/screens/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());

  //FirebaseFirestore.instance.collection('TesteColeção').add(mapa);
}

Map<String, String> mapa = {'teste chave': 'teste valor'};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 53, 75, 52),
        scaffoldBackgroundColor: const Color.fromRGBO(69, 120, 66, 1),
      ),
      home: const SplashScreen(),
    );
  }
}
