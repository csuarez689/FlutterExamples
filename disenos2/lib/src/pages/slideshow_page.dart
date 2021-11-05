import 'package:disenos2/src/widgets/custom_slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          activeColor: Theme.of(context).colorScheme.secondary,
          inactiveColor: Theme.of(context).disabledColor,
          activeBulletSize: 14,
          inactiveBulletSize: 10,
        ),
      ),
    );
  }
}
