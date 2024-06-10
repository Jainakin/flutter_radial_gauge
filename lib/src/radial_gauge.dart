import 'dart:math';
import 'package:flutter/material.dart';

/// A customizable radial gauge widget for Flutter.
///
/// This widget allows you to create interactive radial gauges for displaying
/// values in a circular format. You can customize the appearance and behavior
/// of the gauge, including its size, colors, pointer style, and looping behavior.
///
/// To use this widget, simply create a `RadialGauge` object and pass in the
/// desired parameters. For example:
///
/// ```dart
/// RadialGauge(
///   initialValue: 50.0,
///   onValueChanged: (value) {
///     print('Current value: $value');
///   },
/// )
/// ```

class RadialGauge extends StatefulWidget {
  /// The initial value of the gauge.
  ///
  /// Defaults to 0.0.
  final double initialValue;

  /// Called when the value of the gauge changes.
  ///
  /// This callback provides the new value of the gauge as a double.
  final ValueChanged<double> onValueChanged;

  /// The inner radius of the gauge.
  ///
  /// This determines the size of the inner circle of the gauge.
  ///
  /// Defaults to 80.0.
  final double innerRadius;

  /// The outer radius of the gauge.
  ///
  /// This determines the overall size of the gauge.
  ///
  /// Defaults to 100.0.
  final double outerRadius;

  /// The background color of the gauge.
  ///
  /// Defaults to `const Color(0xFFFDE9E0)`.
  final Color backgroundColor;

  /// The foreground color of the gauge, representing the filled portion.
  ///
  /// Defaults to `const Color(0xFFD08D74)`.
  final Color foregroundColor;

  /// The radius of the pointer circle.
  ///
  /// Defaults to 12.0.
  final double pointerRadius;

  /// The stroke width of the pointer circle.
  ///
  /// Defaults to 10.0.
  final double pointerStrokeWidth;

  /// The fill color of the pointer circle.
  ///
  /// Defaults to `const Color(0xFF312C2E)`.
  final Color pointerFillColor;

  /// The stroke color of the pointer circle.
  ///
  /// Defaults to `const Color(0xFFFABCB8)`.
  final Color pointerStrokeColor;

  /// The color of the small rectangle inside the pointer circle.
  ///
  /// Defaults to `Colors.green`.
  final Color pointerRectColor;

  /// Creates a new RadialGauge widget.
  const RadialGauge({
    super.key,
    this.initialValue = 0.0,
    required this.onValueChanged,
    this.innerRadius = 80.0,
    this.outerRadius = 100.0,
    this.foregroundColor = const Color(0xFFD08D74),
    this.backgroundColor = const Color(0xFFFDE9E0),
    this.pointerRadius = 12.0,
    this.pointerStrokeWidth = 10.0,
    this.pointerStrokeColor = const Color(0xFFFABCB8),
    this.pointerFillColor = const Color(0xFF312C2E),
    this.pointerRectColor = Colors.green,
  });

  @override
  State<RadialGauge> createState() => _RadialGaugeState();
}

class _RadialGaugeState extends State<RadialGauge> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _updateValue(details.localPosition);
        });
      },
      child: CustomPaint(
        painter: RadialGaugePainter(
          value: _value,
          innerRadius: widget.innerRadius,
          outerRadius: widget.outerRadius,
          foregroundColor: widget.foregroundColor,
          backgroundColor: widget.backgroundColor,
          pointerRadius: widget.pointerRadius,
          pointerStrokeWidth: widget.pointerStrokeWidth,
          pointerFillColor: widget.pointerFillColor,
          pointerStrokeColor: widget.pointerStrokeColor,
          pointerRectColor: widget.pointerRectColor,
        ),
        child: SizedBox(
          height: widget.outerRadius * 2,
          width: widget.outerRadius * 2,
        ),
      ),
    );
  }

  void _updateValue(Offset position) {
    double dx = position.dx - widget.outerRadius;
    double dy = position.dy - widget.outerRadius;
    double angle = atan2(dy, dx);
    if (angle < 0) {
      angle += 2 * pi;
    }
    _value = (angle / (2 * pi) * 100).clamp(0.0, 100.0);
    widget.onValueChanged(_value);
  }
}

class RadialGaugePainter extends CustomPainter {
  final double value;
  final double innerRadius;
  final double outerRadius;
  final Color backgroundColor;
  final Color foregroundColor;
  final double pointerRadius;
  final double pointerStrokeWidth;
  final Color pointerFillColor;
  final Color pointerStrokeColor;
  final Color pointerRectColor;

  RadialGaugePainter({
    required this.value,
    required this.innerRadius,
    required this.outerRadius,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.pointerRadius,
    required this.pointerStrokeWidth,
    required this.pointerFillColor,
    required this.pointerStrokeColor,
    required this.pointerRectColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Draw background circle
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = outerRadius - innerRadius
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(centerX, centerY), outerRadius, backgroundPaint);

    // Draw progress arc
    final progressPaint = Paint()
      ..color = foregroundColor
      ..strokeWidth = outerRadius - innerRadius
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;
    final progressAngle = 2 * pi * (value / 100);
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: outerRadius),
      -pi / 2,
      progressAngle,
      false,
      progressPaint,
    );

    // Calculate coordinates of the end of progress arc
    final endX = centerX + outerRadius * cos(progressAngle - pi / 2);
    final endY = centerY + outerRadius * sin(progressAngle - pi / 2);

    // Draw outer circle for picker
    final outerCirclePaint = Paint()
      ..color = pointerStrokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = pointerStrokeWidth;
    canvas.drawCircle(Offset(endX, endY), pointerRadius, outerCirclePaint);

    // Draw inner circle for picker
    final pickerPaint = Paint()
      ..color = pointerFillColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(endX, endY), pointerRadius, pickerPaint);

    // Draw inner rectangle for picker
    final innerRectPaint = Paint()..color = pointerRectColor;
    canvas.save();
    canvas.translate(endX, endY);
    canvas.rotate(progressAngle);
    canvas.drawRect(
      Rect.fromCenter(
        center: const Offset(0, 0),
        width: 1.0,
        height: pointerStrokeWidth * 1.0,
      ),
      innerRectPaint,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
