import 'package:flutter/material.dart';
import 'package:pages_transitions/src/pages/page_two.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page One'),
        backgroundColor: Colors.indigoAccent,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          'Page One',
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, _makeRoute()),
        child: Icon(Icons.ac_unit),
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }

  Route _makeRoute() {
    return PageRouteBuilder(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) =>
          PageTwo(),
      transitionDuration: const Duration(milliseconds: 3000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        // return SlideTransition(
        //   position: Tween<Offset>(
        //     begin: const Offset(0.0, -1.0),
        //     end: Offset.zero,
        //   ).animate(curvedAnimation),
        //   child: child,
        // );

        // return ScaleTransition(
        //   scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
        //   child: child,
        // );

        // return RotationTransition(
        //   turns: Tween<double>(begin: 0, end: 1).animate(curvedAnimation),
        //   child: child,
        // );

        return FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
