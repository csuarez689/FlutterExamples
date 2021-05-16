import 'package:flutter/material.dart';

bool isNumeric(String s) {
  if (s.isEmpty) return false;

  final n = num.tryParse(s);

  return (n == null) ? false : true;
}

void mostrarSnackbar(BuildContext context, String mensaje) {
  final snack = SnackBar(
    content: Text(mensaje),
    duration: Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snack);
}

void mostarAlerta(BuildContext context, String mensaje) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Información incorrecta'),
          content: Text(mensaje),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Aceptar'))
          ],
        );
      });
}

void mostrarErrorSnackbar(BuildContext context, String mensaje) {
  final snack = SnackBar(
    content: Text(mensaje, textAlign: TextAlign.center),
    duration: Duration(seconds: 6),
    backgroundColor: Colors.red[500],
  );
  ScaffoldMessenger.of(context).showSnackBar(snack);
}
