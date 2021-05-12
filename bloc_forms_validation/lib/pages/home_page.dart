import 'package:bloc_forms_validation/blocs/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email:${bloc.email}'),
            SizedBox(height: 20.0),
            Text('Password:${bloc.password}')
          ],
        ),
      ),
    );
  }
}
