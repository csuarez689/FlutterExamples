import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('CS'),
              backgroundColor: Colors.brown,
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://sensorinformativo.com/media/wimg/descarga_23_scjPZcw.jpg'),
              radius: 25.0,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('resources/images/17.1 jar-loading.gif'),
          image: NetworkImage(
              'https://pm1.narvii.com/7364/da94feb1cc9c7f880e55dfffcce16e1b422339ffr1-2048-1536v2_hq.jpg'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
