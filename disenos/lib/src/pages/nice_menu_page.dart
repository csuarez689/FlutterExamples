import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class NiceMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titles(),
                _buttonsGrid(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottonNavigationBar(context),
    );
  }

  Widget _fondoApp() {
    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.4),
            end: FractionalOffset(0.0, 1.0),
            colors: [
              Color.fromRGBO(52, 54, 101, 1.0),
              Color.fromRGBO(35, 37, 57, 1.0)
            ]),
      ),
    );

    final box = Positioned(
      top: -60,
      left: -30,
      child: Transform.rotate(
        angle: -pi / 4.0,
        child: Container(
          height: 320.0,
          width: 320.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(236, 98, 188, 1.0),
                Color.fromRGBO(241, 142, 172, 1.0)
              ])),
        ),
      ),
    );

    return Stack(
      children: <Widget>[gradient, box],
    );
  }

  Widget _titles() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Classify Transaction',
              style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Classify this transaction into a particular category',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _bottonNavigationBar(BuildContext context) {
    return Container(
      color: Color.fromRGBO(55, 57, 84, 1.0),
      padding: EdgeInsets.only(top: 10),
      child: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(55, 57, 84, 1.0),
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Color.fromRGBO(116, 117, 152, 1.0),
        type: BottomNavigationBarType.fixed,
        iconSize: 30.0,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.bubble_chart),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.supervised_user_circle),
          ),
        ],
      ),
    );
  }

  Widget _buttonsGrid() {
    return Table(
      children: [
        TableRow(children: [
          _menuButton(
              color: Colors.pinkAccent,
              icon: Icons.notifications_none_outlined,
              title: 'Notificaciones'),
          _menuButton(
              color: Colors.blueAccent,
              icon: Icons.calendar_today,
              title: 'Eventos'),
        ]),
        TableRow(children: [
          _menuButton(
              color: Colors.pinkAccent,
              icon: Icons.notifications_none_outlined,
              title: 'Notificaciones'),
          _menuButton(
              color: Colors.blueAccent,
              icon: Icons.calendar_today,
              title: 'Eventos'),
        ]),
        TableRow(children: [
          _menuButton(
              color: Colors.pinkAccent,
              icon: Icons.notifications_none_outlined,
              title: 'Notificaciones'),
          _menuButton(
              color: Colors.blueAccent,
              icon: Icons.calendar_today,
              title: 'Eventos'),
        ]),
      ],
    );
  }

  Widget _menuButton({String title, Color color, IconData icon}) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 1,
        sigmaY: 1,
      ),
      child: Container(
        height: 180.0,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundColor: color,
              child: Icon(
                icon,
                color: Colors.white,
                size: 35,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                  color: color, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
