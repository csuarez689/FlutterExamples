import 'package:bloc_forms_validation/widgets/stack_background_header.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StackBackgroundHeader(
            additionalWidgets: [_personIcon(context)],
          ),
        ],
      ),
    );
  }

  Widget _personIcon(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height * 0.4,
        width: double.infinity,
        child: Column(
          children: [
            Icon(Icons.person_pin_circle, color: Colors.white, size: 100),
            SizedBox(height: 10.0),
            Text(
              'Claudio Suarez',
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}
