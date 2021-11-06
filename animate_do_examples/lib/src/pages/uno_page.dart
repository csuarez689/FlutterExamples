import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'package:animate_do_examples/src/pages/twitter_page.dart';
import 'package:animate_do_examples/src/pages/navigation_page.dart';

class UnoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate_do Examples'),
        actions: [
          IconButton(
              icon: FaIcon(FontAwesomeIcons.twitter),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => TwitterPage()));
              }),
          IconButton(
              icon: FaIcon(FontAwesomeIcons.chevronRight),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => UnoPage()));
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(delay: Duration(milliseconds: 500), child: FaIcon(Icons.new_releases, color: Colors.blue, size: 40)),
            FadeInDown(
              child: Text('Titulo', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200)),
              delay: Duration(milliseconds: 400),
            ),
            FadeInDown(
              child: Text('Soy un texto pequeño', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
              delay: Duration(milliseconds: 1100),
            ),
            FadeInLeft(delay: Duration(milliseconds: 1300), child: Container(width: 220, height: 2, color: Colors.blue))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => NavigationPage()));
          },
          child: FaIcon(FontAwesomeIcons.play)),
    );
  }
}
