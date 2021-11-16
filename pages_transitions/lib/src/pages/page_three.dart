import 'package:flutter/material.dart';

class PAgeThree extends StatelessWidget {
  const PAgeThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page One'),
        backgroundColor: Colors.indigoAccent,
      ),
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Text(
          'Page Three',
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
    );
  }
}
