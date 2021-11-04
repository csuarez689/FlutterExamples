import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryStrokeWidth;
  final double secondaryStrokeWidth;

  RadialProgress({
    @required this.percentage,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryStrokeWidth = 10,
    this.secondaryStrokeWidth = 4,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double _oldPercentage;

  @override
  void initState() {
    _oldPercentage = widget.percentage;
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0.0);
    final diff = widget.percentage - _oldPercentage;
    _oldPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgressPainter(
              (widget.percentage - diff) + (diff * _controller.value),
              widget.primaryColor,
              widget.secondaryColor,
              widget.primaryStrokeWidth,
              widget.secondaryStrokeWidth,
            ),
          ),
        );
      },
    );
  }
}

class _MiRadialProgressPainter extends CustomPainter {
  final percent;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryStrokeWidth;
  final double secondaryStrokeWidth;

  _MiRadialProgressPainter(
    this.percent,
    this.primaryColor,
    this.secondaryColor,
    this.primaryStrokeWidth,
    this.secondaryStrokeWidth,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = secondaryStrokeWidth
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;
    Offset center = Offset(size.width * .5, size.height / 2);
    double radius = min(size.width * .5, size.height * .5);
    canvas.drawCircle(center, radius, paint);

    final paintArc = Paint()
      ..strokeWidth = primaryStrokeWidth
      ..strokeCap = StrokeCap.round
      ..color = primaryColor
      ..style = PaintingStyle.stroke;
    double arcAngle = 2 * pi * (percent / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
