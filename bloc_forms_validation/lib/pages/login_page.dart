import 'package:bloc_forms_validation/blocs/login_bloc.dart';
import 'package:bloc_forms_validation/blocs/provider.dart';
import 'package:bloc_forms_validation/pages/home_page.dart';
import 'package:bloc_forms_validation/widgets/stream_elevated_button.dart';
import 'package:bloc_forms_validation/widgets/stream_input_form.dart';
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
          _loginForm(context),
        ],
      ),
    );
  }

  Widget _personIcon(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
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

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 200.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            margin: EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 3.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Ingreso', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 60.0),
                StreamInputForm(
                  stream: bloc.emailStream,
                  labelText: 'Correo Electrónico',
                  icon: Icons.alternate_email,
                  hintText: 'ejemplo@correo.com',
                  keyboardType: TextInputType.emailAddress,
                  onChanged: bloc.changeEmail,
                ),
                SizedBox(height: 30.0),
                StreamInputForm(
                  stream: bloc.passwordStream,
                  labelText: 'Contraseña',
                  icon: Icons.lock_outline,
                  obscureText: true,
                  onChanged: bloc.changePassword,
                ),
                SizedBox(height: 30.0),
                StreamElevatedButton(
                  child: Text(
                    'Ingresar',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () => _loginAction(context, bloc),
                  stream: bloc.validFormStream,
                ),
              ],
            ),
          ),
          Text(
            '¿Ovidaste tu contraseña?',
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 16.0,
                decoration: TextDecoration.underline),
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  _loginAction(BuildContext context, LoginBloc bloc) {
    print('=======================================');
    print('Email: ${bloc.email}');
    print('Password: ${bloc.password}');
    print('=======================================');
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }
}
