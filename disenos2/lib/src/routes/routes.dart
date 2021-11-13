import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos2/src/pages/animaciones_page.dart';
import 'package:disenos2/src/pages/circular_graphs_page.dart';
import 'package:disenos2/src/pages/emergency_page.dart';
import 'package:disenos2/src/pages/headers_page.dart';
import 'package:disenos2/src/pages/pinterest_page.dart';
import 'package:disenos2/src/pages/slideshow_page.dart';
import 'package:disenos2/src/pages/slivers_page.dart';
import 'package:disenos2/src/challenges/cuadrado_animado_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Headers', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Animated Squeare', AnimacionesPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Circular Progress', CircularGraphPage()),
  _Route(FontAwesomeIcons.square, 'Square Loader', CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliversPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
