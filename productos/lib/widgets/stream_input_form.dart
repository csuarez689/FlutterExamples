import 'package:flutter/material.dart';

class StreamInputForm extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final IconData icon;
  final Color iconColor;
  final bool obscureText;
  final Stream<String> stream;
  final Function onChanged;

  StreamInputForm(
      {@required this.labelText,
      @required this.icon,
      @required this.stream,
      this.onChanged,
      this.iconColor = Colors.deepPurple,
      this.keyboardType = TextInputType.text,
      this.hintText = '',
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: stream,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: obscureText,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                  icon: Icon(icon, color: iconColor),
                  hintText: hintText,
                  labelText: labelText,
                  errorText: snapshot.error),
              onChanged: onChanged,
            ),
          );
        });
  }
}
