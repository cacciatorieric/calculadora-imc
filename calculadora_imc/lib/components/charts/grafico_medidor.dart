import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:calculadora_imc/components/charts/anotacao_grafico.dart';

class GraficoMedidor extends StatelessWidget {
  const GraficoMedidor({
    Key? key,
    required this.valorCalculo,
  }) : super(
          key: key,
        );

  final double? valorCalculo;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
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
              //label: 'Abaixo do ideal',
            ),
            GaugeRange(
              startValue: 18.5,
              endValue: 24.9,
              color: Colors.green,
              //label: 'Peso ideal',
            ),
            GaugeRange(
              startValue: 25,
              endValue: 29.9,
              color: const Color.fromARGB(255, 254, 131, 0),
              //label: 'Sobrepeso',
            ),
            GaugeRange(
              startValue: 30,
              endValue: 39.9,
              color: Colors.red,
              //label: 'Obesidade Grau I e II',
            ),
            GaugeRange(
              startValue: 40,
              endValue: 60,
              color: const Color.fromARGB(255, 53, 1, 1),
              //label: 'Obesidade Grau III',
            ),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              value: valorCalculo!,
              enableAnimation: true,
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: AnotacaoGrafico(valor: valorCalculo),
              positionFactor: 0.2,
              angle: 90,
            )
          ],
        )
      ],
    );
  }
}
