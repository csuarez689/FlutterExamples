import 'package:disenos2/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        body: Builder(builder: (context) {
          final show = Provider.of<_MenuModel>(context).show;
          return Stack(
            children: <Widget>[
              PinterestGrid(),
              Positioned(
                bottom: 30,
                child: Container(
                  width: width,
                  child: Align(
                    child: PinterestMenu(
                      show: show,
                      bgColor: Colors.white,
                      activeColor: Colors.pink,
                      inactiveColor: Colors.pink[200]!,
                      items: <PinterestButton>[
                        PinterestButton(
                            onPressed: () => print('pie_chart'),
                            icon: Icons.pie_chart),
                        PinterestButton(
                            onPressed: () => print('search'),
                            icon: Icons.search),
                        PinterestButton(
                            onPressed: () => print('notifications'),
                            icon: Icons.notifications),
                        PinterestButton(
                            onPressed: () => print('supervised_user_circle'),
                            icon: Icons.supervised_user_circle)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List items = List.generate(200, (index) => index);
  ScrollController scrollController = ScrollController();
  double previousScroll = 0;
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > previousScroll) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }
      previousScroll = scrollController.offset;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: scrollController,
      crossAxisCount: 4,
      itemCount: items.length,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemBuilder: (BuildContext context, int index) =>
          PinterestGridItem(index),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 3),
    );
  }
}

class PinterestGridItem extends StatelessWidget {
  final int index;
  PinterestGridItem(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            '$index',
            style: TextStyle(
                fontSize: 20,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;
  bool get show => _show;
  set show(bool value) {
    _show = value;
    notifyListeners();
  }
}
