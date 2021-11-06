import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GorditoButton extends StatelessWidget {
  final Color bgColor1, bgColor2;
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  GorditoButton({
    this.bgColor1 = Colors.grey,
    this.bgColor2 = Colors.blueGrey,
    required this.title,
    this.icon = FontAwesomeIcons.plus,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent,
      child: Stack(
        children: <Widget>[
          _GorditoButtonBackground(icon, bgColor1, bgColor2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 140, width: 40),
              FaIcon(icon, color: Colors.white, size: 40),
              SizedBox(width: 20),
              Expanded(child: Text(title, style: TextStyle(color: Colors.white, fontSize: 18))),
              FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              SizedBox(width: 40),
            ],
          ),
        ],
      ),
    );
  }
}

class _GorditoButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color bgColor1, bgColor2;

  _GorditoButtonBackground(this.icon, this.bgColor1, this.bgColor2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10),
        ],
        gradient: LinearGradient(colors: [bgColor1, bgColor2]),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -10,
              child: FaIcon(icon, size: 110, color: Colors.white.withOpacity(0.2)),
            ),
          ],
        ),
      ),
    );
  }
}
