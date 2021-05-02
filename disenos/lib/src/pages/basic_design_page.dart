import 'package:flutter/material.dart';

class BasicDesignPage extends StatelessWidget {
  final _titleStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final _subtitleStyle = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _image(),
          _header(),
          _actions(),
          _description(),
          _description(),
        ],
      ),
    ));
  }

  Widget _header() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Paisaje de Montaña',
                    style: _titleStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    'Ideal para vacacionar',
                    style: _subtitleStyle,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            SizedBox(width: 7.0),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 30.0,
            ),
            Text(
              '41',
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }

  Widget _actions() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _action(icon: Icons.call, text: "Llamar"),
          _action(icon: Icons.near_me, text: "Ruta"),
          _action(icon: Icons.share, text: "Compartir"),
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
      width: double.infinity,
      child: FadeInImage(
        placeholder: AssetImage('resources/images/loader-landspcape.gif'),
        image: NetworkImage(
            'https://static.educalingo.com/img/en/800/landscape.jpg'),
        height: 220,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _action({IconData icon, String text}) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blueAccent,
          size: 40,
        ),
        SizedBox(height: 5.0),
        Text(
          text,
          style: TextStyle(fontSize: 15, color: Colors.blueAccent),
        )
      ],
    );
  }

  Widget _description() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Quis enim sit quis mollit aliquip culpa non officia nisi laborum. Culpa laborum ut amet eu fugiat labore non veniam ipsum ut irure. Irure laboris veniam anim ad Lorem deserunt sit labore. Sint culpa sunt sint et eu mollit. Irure culpa ipsum pariatur labore officia cupidatat sit enim minim duis consectetur. Excepteur cillum voluptate culpa culpa magna ipsum ullamco.',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
