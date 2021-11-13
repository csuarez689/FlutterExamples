import 'package:disenos2/src/theme/theme_changer.dart';
import 'package:disenos2/src/widgets/custom_slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      body: SafeArea(
        child: CustomSlideshow(
          childrens: <Widget>[
            SvgPicture.asset('assets/svgs/slide-1.svg'),
            SvgPicture.asset('assets/svgs/slide-2.svg'),
            SvgPicture.asset('assets/svgs/slide-3.svg'),
            SvgPicture.asset('assets/svgs/slide-4.svg'),
            SvgPicture.asset('assets/svgs/slide-5.svg'),
          ],
          activeColor: appTheme.colorScheme.secondary,
          inactiveColor: appTheme.disabledColor,
          activeBulletSize: 14,
          inactiveBulletSize: 10,
        ),
      ),
    );
  }
}
