import 'package:disenos2/src/models/layout_model.dart';
import 'package:disenos2/src/pages/slideshow_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:disenos2/src/routes/routes.dart';
import 'package:disenos2/src/theme/theme_changer.dart';

class LauncherTabletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final page = Provider.of<LayoutModel>(context).currentPage;
    print(appTheme.appBarTheme.backgroundColor);
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter - Tablet'),
        backgroundColor: appTheme.colorScheme.secondary,
      ),
      drawer: _MenuPrincipal(),
      body: Row(
        children: [
          Container(width: 300, height: double.infinity, child: _ListaOpciones()),
          Container(width: 2, height: double.infinity, color: appTheme.dividerColor),
          Expanded(child: page),
        ],
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 150,
                child: CircleAvatar(
                  child: Text('CS', style: TextStyle(fontSize: 50)),
                  backgroundColor: accentColor,
                ),
              ),
            ),
            Expanded(child: _ListaOpciones()),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: accentColor),
              title: Text('DarkMode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: accentColor,
                onChanged: (value) => appTheme.darkTheme = value,
              ),
              onTap: () {},
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: accentColor),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  onChanged: (value) => appTheme.customTheme = value,
                  activeColor: accentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final accentColor = appTheme.colorScheme.secondary;
    final layoutModel = Provider.of<LayoutModel>(context);

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(color: appTheme.primaryColorLight),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: accentColor),
        title: Text(pageRoutes[i].title),
        trailing: FaIcon(FontAwesomeIcons.chevronRight, color: accentColor),
        onTap: () {
          layoutModel.currentPage = pageRoutes[i].page;
        },
      ),
    );
  }
}
