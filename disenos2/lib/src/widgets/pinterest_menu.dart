import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final VoidCallback onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final Color bgColor;
  final Color activeColor;
  final Color inactiveColor;
  final bool show;
  final List<PinterestButton> items;

  PinterestMenu({
    this.show = true,
    this.bgColor = Colors.white,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: show ? 1 : 0,
        child: Builder(builder: (context) {
          Provider.of<_MenuModel>(context).activeColor = this.activeColor;
          Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;
          Provider.of<_MenuModel>(context).bgColor = this.bgColor;
          return _PinterestMenuContainer(
            child: _MenuItems(items),
          );
        }),
      ),
    );
  }
}

class _PinterestMenuContainer extends StatelessWidget {
  final Widget child;
  _PinterestMenuContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Provider.of<_MenuModel>(context).bgColor,
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5),
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> items;

  const _MenuItems(this.items);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          items.length, (index) => _PinterestMenuButton(index, items[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_MenuModel>(context);
    final isSelected = provider.selectedItem == index;
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).selectedItem = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: isSelected ? 35 : 25,
          color: isSelected ? provider._activeColor : provider.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedItem = 0;
  Color _bgColor = Colors.white;
  Color _activeColor = Colors.blue;
  Color _inactiveColor = Colors.grey;

  int get selectedItem => this._selectedItem;
  set selectedItem(int index) {
    this._selectedItem = index;
    notifyListeners();
  }

  Color get bgColor => this._bgColor;
  set bgColor(Color color) {
    this._bgColor = color;
  }

  Color get activeColor => this._activeColor;
  set activeColor(Color color) {
    this._activeColor = color;
  }

  Color get inactiveColor => this._inactiveColor;
  set inactiveColor(Color color) {
    this._inactiveColor = color;
  }
}
