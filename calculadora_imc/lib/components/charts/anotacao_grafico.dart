import 'package:flutter/material.dart';

class AnotacaoGrafico extends StatelessWidget {
  const AnotacaoGrafico({
    Key? key,
    required this.valor,
  }) : super(key: key);

  final double? valor;

  @override
  Widget build(BuildContext context) {
    return Container(child: comandoSeta());
  }

  comandoSeta() {
    if (valor! < 19.9) {
      return Column(
        children: [
          const Text(
            'IMC',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14,
            ),
          ),
          Text(
            '$valor',
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 14,
            ),
          ),
        ],
      );
    } else if (valor! < 24.9) {
      return Text(
        '$valor',
        style: const TextStyle(
          color: Colors.green,
          fontSize: 14,
        ),
      );
    } else if (valor! < 29.9) {
      return Text(
        '$valor',
        style: const TextStyle(
          color: Colors.orange,
          fontSize: 14,
        ),
      );
    } else if (valor! < 39.9) {
      return Text(
        '$valor',
        style: const TextStyle(
          color: Colors.red,
          fontSize: 14,
        ),
      );
    } else if (valor! > 40) {
      return Text(
        '$valor',
        style: const TextStyle(
          color: Color.fromARGB(255, 53, 1, 1),
          fontSize: 14,
        ),
      );
    }
  }
}
