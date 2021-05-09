import 'package:bloc_forms_validation/widgets/gradient_background.dart';
import 'package:flutter/material.dart';

class StackBackgroundHeader extends StatelessWidget {
  final List<Widget> additionalWidgets;

  StackBackgroundHeader({this.additionalWidgets = const []});

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      GradientBackground(),
      Positioned(child: _circle(), top: 90, left: 30),
      Positioned(child: _circle(), top: -40, right: -30),
      Positioned(child: _circle(), bottom: -50, right: -10),
      Positioned(child: _circle(), bottom: 110, right: 40),
      Positioned(child: _circle(), bottom: -50, left: -20),
      ...additionalWidgets
    ];

    return Stack(children: list);
  }

  Widget _circle() {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color.fromRGBO(255, 255, 255, 0.03)));
  }
}
