import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool trigger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.play),
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          setState(() => trigger = !trigger);
        },
      ),
      backgroundColor: Color(0xff1da1f2),
      body: Container(
        child: ZoomOut(
          animate: trigger,
          duration: Duration(milliseconds: 1000),
          from: 20,
          child: Center(child: FaIcon(FontAwesomeIcons.twitter, size: 60, color: Colors.white)),
        ),
      ),
    );
  }
}
