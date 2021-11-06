import 'package:animate_do/animate_do.dart';
import 'package:animate_do_examples/src/pages/uno_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NotificationsModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications Page'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        floatingActionButton: _FloatingButtom(),
        bottomNavigationBar: _BottomNavigationBar(),
      ),
    );
  }
}

class _FloatingButtom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final _notificationsModel = Provider.of<_NotificationsModel>(context, listen: false);
        int count = _notificationsModel.count;
        count++;
        _notificationsModel.count = count;
        if (count > 1) {
          final controller = _notificationsModel.bounceController;
          controller.forward(from: 0.0);
        }
      },
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.deepPurple,
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int countNotifications = Provider.of<_NotificationsModel>(context).count;
    final String text = countNotifications > 99 ? '99+' : countNotifications.toString();
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.fish), label: 'Fish'),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                  child: BounceInDown(
                    from: 12,
                    animate: countNotifications > 0,
                    child: Bounce(
                      from: 10,
                      controller: (controller) => Provider.of<_NotificationsModel>(context).bounceController = controller,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
                        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  right: 0,
                  top: 0)
            ],
          ),
        ),
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.cat), label: 'Cat'),
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.medal), label: 'Medals'),
      ],
    );
  }
}

class _NotificationsModel extends ChangeNotifier {
  int _count = 0;
  late AnimationController _bounceController;

  int get count => this._count;

  set count(int value) {
    this._count = value;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;
  set bounceController(AnimationController value) {
    this._bounceController = value;
  }
}
