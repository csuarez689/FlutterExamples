import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyHeader extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final Color bgColor1, bgColor2;

  EmergencyHeader({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.bgColor1 = Colors.grey,
    this.bgColor2 = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    final Color textWhite = Colors.white.withOpacity(0.7);
    return Stack(
      children: <Widget>[
        _IconHeaderBackground(bgColor1, bgColor2),
        Positioned(
          top: -50,
          left: -50,
          child: FaIcon(icon, size: 190, color: Colors.white.withOpacity(0.2)),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 40, width: double.infinity),
            Text(
              subtitle,
              style: TextStyle(color: textWhite, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(color: textWhite, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            FaIcon(icon, size: 80, color: Colors.white.withOpacity(0.9)),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color bgColor1, bgColor2;

  _IconHeaderBackground(this.bgColor1, this.bgColor2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            bgColor1,
            bgColor2,
          ],
        ),
      ),
    );
  }
}
