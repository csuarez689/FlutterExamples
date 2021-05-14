import 'package:flutter/material.dart';

class StreamElevatedButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final double paddingX;
  final double paddingY;
  final Widget child;
  final BorderRadiusGeometry borderRadius;
  final Stream stream;
  final Function onPressed;

  StreamElevatedButton(
      {@required this.child,
      @required this.stream,
      @required this.onPressed,
      this.bgColor,
      this.textColor,
      this.paddingX = 80.0,
      this.paddingY = 15.0,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    final newBgColor = bgColor ?? Theme.of(context).primaryColor;
    final newTextColor = textColor ??
        (newBgColor.computeLuminance() > 0.5 ? Colors.black : Colors.white);
    final newBorderRadius = borderRadius ?? BorderRadius.circular(8.0);

    return StreamBuilder<bool>(
        stream: stream,
        builder: (context, snapshot) {
          return ElevatedButton(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: paddingX, vertical: paddingY),
              child: child,
            ),
            style: ElevatedButton.styleFrom(
              primary: newBgColor,
              onPrimary: newTextColor,
              shape: RoundedRectangleBorder(
                borderRadius: newBorderRadius,
              ),
            ),
            onPressed: snapshot.hasData ? onPressed : null,
          );
        });
  }
}
