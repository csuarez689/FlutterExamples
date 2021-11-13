import 'package:animate_do/animate_do.dart';
import 'package:disenos2/src/widgets/emergency_header.dart';
import 'package:disenos2/src/widgets/gordito_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _ItemBoton {
  final IconData icon;
  final String title;
  final Color bgColor1;
  final Color bgColor2;

  _ItemBoton(this.icon, this.title, this.bgColor1, this.bgColor2);
}

class EmergencyPage extends StatelessWidget {
  final items = <_ItemBoton>[
    new _ItemBoton(
        FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5)),
    new _ItemBoton(
        FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6)),
    new _ItemBoton(
        FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3)),
    new _ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
    new _ItemBoton(
        FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5)),
    new _ItemBoton(
        FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6)),
    new _ItemBoton(
        FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3)),
    new _ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
    new _ItemBoton(
        FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5)),
    new _ItemBoton(
        FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6)),
    new _ItemBoton(
        FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3)),
    new _ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
  ];

  @override
  Widget build(BuildContext context) {
    bool isLarge = MediaQuery.of(context).size.height > 500;
    return Scaffold(
      // body: EmergencyHeader(
      //   title: 'Asistencia Médica',
      //   subtitle: 'Solicitaste',
      //   icon: FontAwesomeIcons.plus,
      //   bgColor1: Color(0xff526bf6),
      //   bgColor2: Color(0xff67acf2),
      // ),
      // body: Center(
      //   child: GorditoButton(
      //     bgColor1: Colors.red,
      //     bgColor2: Color(0xff906ef5),
      //     onPressed: () => print('presionado'),
      //     title: 'Accidente de transito',
      //     icon: FontAwesomeIcons.gitlab,
      //   ),
      // ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: isLarge ? 150 : 0),
            child: SafeArea(
              child: ListView.builder(
                padding: EdgeInsets.only(top: isLarge ? 100 : 0),
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final item = items[index];

                  return FadeInLeftBig(
                    duration: Duration(milliseconds: 300),
                    child: GorditoButton(
                        icon: item.icon,
                        title: item.title,
                        bgColor1: item.bgColor1,
                        bgColor2: item.bgColor2,
                        onPressed: () => print(item.title)),
                  );
                },
                itemCount: items.length,
              ),
            ),
          ),
          if (isLarge)
            EmergencyHeader(
              title: 'Asistencia Médica',
              subtitle: 'Solicitaste',
              icon: FontAwesomeIcons.plus,
              bgColor1: Color(0xff526bf6),
              bgColor2: Color(0xff67acf2),
            ),
          Positioned(
            child: RawMaterialButton(
              child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white.withOpacity(0.8)),
              onPressed: () {},
              shape: CircleBorder(),
              padding: EdgeInsets.all(15),
            ),
            right: -10,
            top: 35,
          )
        ],
      ),
    );
  }
}
