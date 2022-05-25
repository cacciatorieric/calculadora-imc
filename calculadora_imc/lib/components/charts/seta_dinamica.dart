import 'package:flutter/material.dart';

class SetaDinamica extends StatelessWidget {
  const SetaDinamica({
    Key? key,
    required this.valorCalculado,
  }) : super(key: key);

  final double? valorCalculado;

  @override
  Widget build(BuildContext context) {
    double? valor = valorCalculado;
    return Column(
      children: [
        Text(valor! < 10 ? 'fodase' : 'beija saco'),
        Text(valor < 20 ? 'pelo de saco' : 'pepeka'),
        Text(valor < 30 ? 'baitosa' : 'sao paulino'),
        Text(valor < 40 ? 'gostosa' : 'fresco'),

      ],
    );
  }
}
