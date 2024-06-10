
# Radial Gauge Flutter Package

A customizable RadialGauge widget for Flutter applications. This widget allows you to create interactive radial gauges for displaying values in a circular format. You can customize the appearance and behavior of the gauge, including its size, colors, pointer style, and looping behavior.

## Features

- Customizable appearance (size, colors, pointer style, etc.)
- Interactive gauge with callback for value changes
- Easy to integrate and use

## Getting Started

### Prerequisites

- Flutter SDK: `>=1.17.0`
- Dart SDK: `>=3.0.0 <4.0.0`

### Installation

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_radial_gauge: ^0.0.1
```

Then run:

```sh
flutter pub get
```

## Usage

To use the RadialGauge widget, import the package:

```dart
import 'package:flutter_radial_gauge/flutter_radial_gauge.dart';
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

### Example

Here is a complete example of using the RadialGauge widget in a Flutter application:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_radial_gauge/flutter_radial_gauge.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Radial Gauge Example')),
        body: Center(
          child: RadialGauge(
            initialValue: 50.0,
            onValueChanged: (value) {
              print('Current value: $value');
            },
          ),
        ),
      ),
    );
  }
}
```

## Parameters

The RadialGauge widget accepts the following parameters:

- `initialValue`: The initial value of the gauge. Defaults to `0.0`.
- `onValueChanged`: Called when the value of the gauge changes. This callback provides the new value of the gauge as a double.
- `innerRadius`: The inner radius of the gauge. This determines the size of the inner circle of the gauge. Defaults to `80.0`.
- `outerRadius`: The outer radius of the gauge. This determines the overall size of the gauge. Defaults to `100.0`.
- `backgroundColor`: The background color of the gauge. Defaults to `const Color(0xFFFDE9E0)`.
- `foregroundColor`: The foreground color of the gauge, representing the filled portion. Defaults to `const Color(0xFFD08D74)`.
- `pointerRadius`: The radius of the pointer circle. Defaults to `12.0`.
- `pointerStrokeWidth`: The stroke width of the pointer circle. Defaults to `10.0`.
- `pointerFillColor`: The fill color of the pointer circle. Defaults to `const Color(0xFF312C2E)`.
- `pointerStrokeColor`: The stroke color of the pointer circle. Defaults to `const Color(0xFFFABCB8)`.
- `pointerRectColor`: The color of the small rectangle inside the pointer circle. Defaults to `Colors.green`.

## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

### How to Contribute

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add new feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Open a pull request.

## License

This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Additional Information

For more information, visit the [package homepage](https://github.com/Jainakin/flutter_radial_gauge). If you encounter any issues, please file them on the [issue tracker](https://github.com/Jainakin/flutter_radial_gauge/issues). Expect a response within 48 hours.
