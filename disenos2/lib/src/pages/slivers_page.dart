import 'package:flutter/material.dart';

class SliversPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            child: _BottomNavigaror(),
            bottom: -10,
            right: -2,
          ),
        ],
      ),
    );
  }
}

class _BottomNavigaror extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xffed6762)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
          ),
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 3),
        ),
      ),
      width: size.width * 0.6,
      height: 90,
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final Color bgColor;

  _Item(this.title, this.bgColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      height: 130,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Text('Title', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Color(0xff532128))),
          ),
          Stack(
            children: <Widget>[
              SizedBox(width: 100),
              Positioned(bottom: 6, child: Container(width: 75, height: 8, color: Color(0xfff7cdd5))),
              Container(
                child: Text('List', style: TextStyle(color: Color(0xffd93a39), fontSize: 40, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _Item('Orange', Color(0xffF08F66)),
    _Item('Family', Color(0xffF2A38A)),
    _Item('Subscriptions', Color(0xffF7CDD5)),
    _Item('Books', Color(0xffFCEBAF)),
    _Item('Orange', Color(0xffF08F66)),
    _Item('Family', Color(0xffF2A38A)),
    _Item('Subscriptions', Color(0xffF7CDD5)),
    _Item('Books', Color(0xffFCEBAF)),
    _Item('Orange', Color(0xffF08F66)),
    _Item('Family', Color(0xffF2A38A)),
    _Item('Subscriptions', Color(0xffF7CDD5)),
    _Item('Books', Color(0xffFCEBAF)),
    _Item('Orange', Color(0xffF08F66)),
    _Item('Family', Color(0xffF2A38A)),
    _Item('Subscriptions', Color(0xffF7CDD5)),
    _Item('Books', Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
              minHeight: 180,
              maxHeight: 220,
              child: Container(alignment: Alignment.centerLeft, color: Colors.white, child: _Title()),
            )),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(width: double.infinity, height: 200),
          ]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverCustomHeaderDelegate({required this.minHeight, required this.maxHeight, required this.child});

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => minHeight > maxHeight ? minHeight : maxHeight;

  @override
  double get minExtent => minHeight > maxHeight ? maxHeight : minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
