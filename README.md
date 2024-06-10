<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Radial Gauge Flutter Package
This package provides a customizable RadialGauge widget for Flutter applications. This widget allows you to create interactive radial gauges for displaying values in a circular format. You can customize the appearance and behavior of the gauge, including its size, colors, pointer style, and looping behavior.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

To use the RadialGauge widget, import the package:

```dart
import 'package:radial_gauge/radial_gauge.dart';
```

Then create a RadialGauge object and pass in the desired parameters. For example:

```dart
RadialGauge(
  initialValue: 50.0,
  onValueChanged: (value) {
    print('Current value: $value');
  },
)
```

## Parameters
The RadialGauge widget accepts the following parameters:
initialValue: The initial value of the gauge. Defaults to 0.0.
onValueChanged: Called when the value of the gauge changes. This callback provides the new value of the gauge as a double.
innerRadius: The inner radius of the gauge. This determines the size of the inner circle of the gauge. Defaults to 80.0.
outerRadius: The outer radius of the gauge. This determines the overall size of the gauge. Defaults to 100.0.
backgroundColor: The background color of the gauge. Defaults to const Color(0xFFFDE9E0).
foregroundColor: The foreground color of the gauge, representing the filled portion. Defaults to const Color(0xFFD08D74).
pointerRadius: The radius of the pointer circle. Defaults to 12.0.
pointerStrokeWidth: The stroke width of the pointer circle. Defaults to 10.0.
pointerFillColor: The fill color of the pointer circle. Defaults to const Color(0xFF312C2E).
pointerStrokeColor: The stroke color of the pointer circle. Defaults to const Color(0xFFFABCB8).
pointerRectColor: The color of the small rectangle inside the pointer circle. Defaults to Colors.green.

## Contributing
Contributions are welcome! Please feel free to submit issues and pull requests.

## License
This package is licensed under the MIT License. See the LICENSE file for details.

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
