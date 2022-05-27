import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:calculadora_imc/components/charts/anotacao_grafico.dart';

class GraficoMedidor extends StatelessWidget {
  const GraficoMedidor({Key? key, required this.valorCalculo})
      : super(key: key);

  final double? valorCalculo;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          canScaleToFit: true,
          startAngle: 180,
          endAngle: 0,
          minimum: 0,
          maximum: 60,
          interval: 5,
          showLabels: false,
          showAxisLine: false,
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 0,
              endValue: 60,
              startWidth: 65,
              endWidth: 65,
              gradient: SweepGradient(colors: <Color>[
                Colors.blue.shade200,
                Colors.blue,
                Colors.green,
                Colors.orange,
                Colors.red,
                const Color.fromARGB(255, 30, 0, 1),
              ], stops: const <double>[
                0.10,
                0.20,
                0.30,
                0.50,
                0.60,
                0.75,
              ]),
            ),
          ],
          pointers: <GaugePointer>[
            MarkerPointer(
                value: valorCalculo!,
                enableAnimation: true,
                color: Colors.white,
                markerOffset: 55,
                markerWidth: 40,
                markerHeight: 20,
                markerType: MarkerType.triangle)
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: AnotacaoGrafico(valor: valorCalculo),
              positionFactor: 0.5,
              angle: 90,
            )
          ],
        )
      ],
    );
  }
}
