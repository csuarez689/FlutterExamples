import 'package:disenos2/src/theme/theme_changer.dart';
import 'package:disenos2/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CircularGraphPage extends StatefulWidget {
  @override
  State<CircularGraphPage> createState() => _CircularGraphPageState();
}

class _CircularGraphPageState extends State<CircularGraphPage> {
  double percentage = 0.0;
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
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
            primaryColor: appTheme.colorScheme.secondary,
            secondaryColor: appTheme.disabledColor.withOpacity(0.5),
            primaryStrokeWidth: 12,
            secondaryStrokeWidth: 7,
          ),
        ),
      ),
    );
  }
}
