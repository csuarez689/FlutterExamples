import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () => _showAlert(context),
        child: Text('Mostrar alerta'),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          shape: StadiumBorder(),
        ),
      )),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: Text('Titulo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Este es el contenido de la caja de alerta'),
            FlutterLogo(size: 100)
          ],
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar')),
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Aceptar'))
        ],
      ),
    );
  }
}
