import 'dart:math';

import 'package:flutter/material.dart';

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotacion;
  late Animation<double> _opacidad;
  late Animation<double> _opacidadOut;
  late Animation<double> _moverDerecha;
  late Animation<double> _grow;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );
    _rotacion = Tween(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
          parent: _animationController,
          curve: Interval(0, 0.25, curve: Curves.easeOut)),
    );
    _opacidadOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _animationController,
          curve: Interval(0.75, 1.0, curve: Curves.easeOut)),
    );
    _moverDerecha = Tween(begin: 0.0, end: 200.0).animate(_animationController);
    _grow = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return AnimatedBuilder(
      child: _Rectangulo(),
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(_moverDerecha.value, 0),
          child: Transform.rotate(
            angle: _rotacion.value,
            child: Opacity(
              opacity: _opacidad.value - _opacidadOut.value,
              child: Transform.scale(scale: _grow.value, child: child),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
