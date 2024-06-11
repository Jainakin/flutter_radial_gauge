import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radial_gauge/flutter_radial_gauge.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Radial Gauge Example')),
        body: Center(
          child: RadialGauge(
            initialValue: 50.0,
            onValueChanged: (value) {
              if (kDebugMode) {
                print('Current value: $value');
              }
            },
            innerRadius: 80.0,
            outerRadius: 100.0,
            foregroundColor: Colors.blue,
            backgroundColor: Colors.grey[200]!,
            pointerRadius: 10.0,
            pointerStrokeWidth: 5.0,
            pointerFillColor: Colors.white,
            pointerStrokeColor: Colors.blue,
            pointerRectColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
