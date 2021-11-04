import 'package:disenos2/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: HeaderCuadrado(),
      // body: const HeaderBorderRadius(),
      // body: const HeaderDiagonal(),
      // body: const HeaderTriangulo(),
      // body: const HeaderPico(),
      // body: const HeaderCurvo(),
      body: HeaderWaves(),
    );
  }
}
