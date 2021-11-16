import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page One'),
        backgroundColor: Colors.indigoAccent,
      ),
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: Text(
          'Page Two',
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
    );
  }
}
