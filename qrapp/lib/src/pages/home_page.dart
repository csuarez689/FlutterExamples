import 'package:flutter/material.dart';

import 'package:barcode_scan2/barcode_scan2.dart';

import 'package:qrapp/src/bloc/scans_bloc.dart';
import 'package:qrapp/src/models/scan_model.dart';

import 'package:qrapp/src/pages/error_page.dart';
import 'package:qrapp/src/pages/tab_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('QR App'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () => scansBloc.deleteAll(),
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _navigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _scanQr,
        child: Icon(Icons.filter_center_focus),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  BottomNavigationBar _navigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapas'),
        BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Webs')
      ],
    );
  }

  Widget _callPage(int page) {
    switch (page) {
      case 0:
        return TabPage(type: 'geo');
        break;
      case 1:
        return TabPage(type: 'web');
        break;
      default:
        return ErrorPage();
        break;
    }
  }

  _scanQr() async {
    //http://slagua2.test/
    //https://maps.google.com/local?q=56.64873600284904,9.310026133831139

    String res = 'https://google.com.ar';

    var result;
    try {
      result = await BarcodeScanner.scan();
    } catch (e) {
      result = e.toString();
      print('Resultado:' + result);
    }

    if (result.rawContent != null) {
      scansBloc.addScan(ScanModel(value: res));
    } else {
      print('Resultado:' + result.rawContent);
    }
  }
}
