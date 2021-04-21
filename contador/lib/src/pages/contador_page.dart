import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  final _textStyle = TextStyle(fontSize: 25);
  int _contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        centerTitle: true,
        elevation: 5.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Numero de taps:',
              style: _textStyle,
            ),
            Text(
              '$_contador',
              style: _textStyle,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _makeButtons(),
    );
  }

  Widget _makeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: Colors.green[600],
          tooltip: "Increment",
          onPressed: _increment,
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        SizedBox(width: 10),
        FloatingActionButton(
          backgroundColor: Colors.red[600],
          tooltip: "Decrement",
          onPressed: _decrement,
          child: Icon(
            Icons.remove,
            size: 30,
          ),
        ),
        SizedBox(width: 10),
        FloatingActionButton(
          tooltip: "Restore",
          onPressed: _reset,
          child: Icon(
            Icons.exposure_zero,
            size: 30,
          ),
        ),
      ],
    );
  }

  void _increment() => setState(() => _contador++);

  void _decrement() => setState(() {
        if (_contador > 0) _contador--;
      });

  void _reset() => setState(() => _contador = 0);
}
