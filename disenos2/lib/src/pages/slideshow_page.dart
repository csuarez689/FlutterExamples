import 'package:disenos2/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(child: _Slides()),
              _DotsNavigator(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DotsNavigator extends StatelessWidget {
  final color = Colors.pink;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _Dot(0),
          _Dot(1),
          _Dot(2),
          _Dot(3),
          _Dot(4),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(
    this.index, {
    this.width = 12.0,
    this.height = 12.0,
    this.activeColor = Colors.pink,
    this.inactiveColor = Colors.grey,
  });

  final double width;
  final double height;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    final pageHasChanged =
        pageViewIndex >= index - 0.5 && pageViewIndex <= index + 0.5;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: pageHasChanged ? activeColor : inactiveColor,
        shape: BoxShape.circle,
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page ?? 0.0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: <Widget>[
          _Slide('assets/svgs/slide-1.svg'),
          _Slide('assets/svgs/slide-2.svg'),
          _Slide('assets/svgs/slide-3.svg'),
          _Slide('assets/svgs/slide-4.svg'),
          _Slide('assets/svgs/slide-5.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;
  _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      height: double.infinity,
      child: SvgPicture.asset(svg),
    );
  }
}
