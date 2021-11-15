import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget {
  final String title;

  const SearchAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        width: double.infinity,
        child: Row(children: <Widget>[
          Text(title, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
          Spacer(),
          Icon(Icons.search, size: 30),
        ]),
      ),
    );
  }
}
