import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {
  final String title;
  final String description;

  ShoeDescription({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          SizedBox(height: 20),
          Text(description, style: TextStyle(color: Colors.black54, height: 1.5)),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
