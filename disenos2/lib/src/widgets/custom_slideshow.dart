import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSlideshow extends StatelessWidget {
  final List<Widget> childrens;
  final bool dotsUp;
  final Color activeColor;
  final Color inactiveColor;
  final double activeBulletSize;
  final double inactiveBulletSize;
  CustomSlideshow({
    required this.childrens,
    this.dotsUp = false,
    required this.activeColor,
    required this.inactiveColor,
    this.activeBulletSize = 12,
    this.inactiveBulletSize = 12,
  });
  @override
  Widget build(BuildContext context) {
    final navigator = _DotsNavigator(childrens.length);
    return ChangeNotifierProvider(
      create: (_) => new _SliderModel(),
      child: Center(
        child: Builder(
          builder: (BuildContext context) {
            final ssModel = Provider.of<_SliderModel>(context);
            ssModel.activeColor = activeColor;
            ssModel.inactiveColor = inactiveColor;
            ssModel.activeBulletSize = activeBulletSize;
            ssModel.inactiveBulletSize = inactiveBulletSize;
            return Column(
              children: <Widget>[
                if (dotsUp) navigator,
                Expanded(child: _Slides(childrens)),
                if (!dotsUp) navigator
              ],
            );
          },
        ),
      ),
    );
  }
}

class _DotsNavigator extends StatelessWidget {
  final int length;
  _DotsNavigator(this.length);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, (i) => _Dot(i)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SliderModel>(context);
    final isSelected = ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage <= index + 0.5;
    final size =
        isSelected ? ssModel.activeBulletSize : ssModel.inactiveBulletSize;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isSelected ? ssModel.activeColor : ssModel.inactiveColor,
        shape: BoxShape.circle,
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> childrens;
  _Slides(this.childrens);
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
      Provider.of<_SliderModel>(context, listen: false).currentPage =
          pageViewController.page ?? 0.0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.childrens.map((child) => _Slide(child)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget child;
  _Slide(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      height: double.infinity,
      child: child,
    );
  }
}

class _SliderModel with ChangeNotifier {
  double _currentPage = 0;
  Color _activeColor = Colors.blue;
  Color _inactiveColor = Colors.grey;
  double _activeBulletSize = 12;
  double _inactiveBulletSize = 12;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get activeColor => this._activeColor;

  set activeColor(Color activeColor) {
    this._activeColor = activeColor;
  }

  Color get inactiveColor => this._inactiveColor;

  set inactiveColor(Color inactiveColor) {
    this._inactiveColor = inactiveColor;
  }

  double get activeBulletSize => this._activeBulletSize;

  set activeBulletSize(double activeBulletSize) {
    this._activeBulletSize = activeBulletSize;
  }

  double get inactiveBulletSize => this._inactiveBulletSize;

  set inactiveBulletSize(double inactiveBulletSize) {
    this._inactiveBulletSize = inactiveBulletSize;
  }
}
