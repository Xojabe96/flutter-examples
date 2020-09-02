import 'package:flutter_examples/model/sample_view.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class RadialEaseExample extends SampleView {
  const RadialEaseExample(Key key) : super(key: key);
  
  @override
  _RadialEaseExampleState createState() => _RadialEaseExampleState();
}

class _RadialEaseExampleState extends SampleViewState {
  _RadialEaseExampleState();
 
  @override
  Widget build(BuildContext context) {
    return getRadialEaseExample();
  }


SfRadialGauge getRadialEaseExample() {
  return SfRadialGauge(
    axes: <RadialAxis>[
      RadialAxis(
          startAngle: 0,
          endAngle: 360,
          showLabels: false,
          showTicks: false,
          radiusFactor: kIsWeb ? 0.8 : 0.9,
          axisLineStyle: AxisLineStyle(
              thicknessUnit: GaugeSizeUnit.factor,
              thickness: isCardView ? 0.07 : 0.1)),
      RadialAxis(
          startAngle: 170,
          endAngle: 170,
          showTicks: false,
          labelFormat: '{value}M',
          showAxisLine: false,
          radiusFactor: kIsWeb ? 0.8 : 0.9,
          minimum: 0,
          maximum: 15,
          showLastLabel: false,
          axisLabelStyle: GaugeTextStyle(
              fontSize: isCardView ? 10 : 12, fontWeight: FontWeight.w500),
          labelOffset: 25,
          interval: isCardView ? 1 : _interval,
          needsRotateLabels: true,
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                positionFactor: 1,
                axisValue: 0,
                widget: Container(
                    height: isCardView ? 30 : 45,
                    width: isCardView ? 30 : 45,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('images/shotput.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ))),
            GaugeAnnotation(
                widget: Container(
              child: const Text('Distance', style: TextStyle(fontSize: 20)),
            ))
          ],
          pointers: <GaugePointer>[
            RangePointer(
              value: 11.5,
              width: 0.1,
              color: const Color(0xFFF67280),
              enableAnimation: true,
              sizeUnit: GaugeSizeUnit.factor,
              animationType: AnimationType.ease,
              gradient: kIsWeb
                  ? null
                  : const SweepGradient(
                      colors: <Color>[Color(0xFFFFB397), Color(0xFFF46AA0)],
                      stops: <double>[0.25, 0.75]),
            ),
            kIsWeb
                ? MarkerPointer(
                    value: 11.5,
                    markerType: MarkerType.circle,
                    enableAnimation: true,
                    animationType: AnimationType.ease,
                    color: Colors.blue,
                    markerHeight: isCardView ? 30 : 40,
                    markerOffset: 4,
                    markerWidth: isCardView ? 30 : 40)
                : MarkerPointer(
                    value: 11.5,
                    markerType: MarkerType.image,
                    enableAnimation: true,
                    animationType: AnimationType.ease,
                    imageUrl: 'images/ball.png',
                    markerHeight: isCardView ? 30 : 40,
                    markerOffset: 4,
                    markerWidth: isCardView ? 30 : 40)
          ])
    ],
  );
}

final double _interval = 1;
}