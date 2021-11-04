import 'package:disenos2/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class CircularGraphPage extends StatefulWidget {
  @override
  State<CircularGraphPage> createState() => _CircularGraphPageState();
}

class _CircularGraphPageState extends State<CircularGraphPage> {
  double percentage = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: () {
          setState(() {
            percentage += 10;
            if (percentage > 100) {
              percentage = 0;
            }
          });
        },
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: RadialProgress(
            percentage: percentage,
            primaryColor: Colors.pinkAccent,
            secondaryColor: Colors.grey,
            primaryStrokeWidth: 10,
            secondaryStrokeWidth: 10,
          ),
        ),
      ),
    );
  }
}
