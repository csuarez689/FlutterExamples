import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:qrapp/src/models/scan_model.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String tipoMapa;
  MapboxMapController mapController;
  ScanModel scan;

  @override
  void initState() {
    super.initState();
    tipoMapa = MapboxStyles.MAPBOX_STREETS;
  }

  @override
  Widget build(BuildContext context) {
    scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Coordenadas QR'),
        actions: [
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              mapController.animateCamera(
                CameraUpdate.newLatLngZoom(
                  scan.getLatLng(),
                  13.0,
                ),
              );
            },
          ),
        ],
      ),
      body: _flutterMap(),
      floatingActionButton: _makeFloatingActionButton(context),
    );
  }

  Widget _flutterMap() {
    return MapboxMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition:
          CameraPosition(target: scan.getLatLng(), zoom: 13.0),
      onStyleLoadedCallback: _onStyleLoadedCallback,
      styleString: tipoMapa,
    );
  }

  void _onMapCreated(MapboxMapController controller) async {
    mapController = controller;
  }

  void _onStyleLoadedCallback() {
    mapController.addSymbol(SymbolOptions(
        geometry: scan.getLatLng(),
        iconImage: "resources/images/location.png",
        iconSize: 0.3,
        iconHaloWidth: 2.0));
  }

  FloatingActionButton _makeFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.repeat),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        String res = '';
        switch (tipoMapa) {
          case MapboxStyles.MAPBOX_STREETS:
            res = MapboxStyles.SATELLITE_STREETS;
            break;
          case MapboxStyles.SATELLITE_STREETS:
            res = MapboxStyles.DARK;
            break;
          default:
            res = MapboxStyles.MAPBOX_STREETS;
        }
        setState(() => tipoMapa = res);
      },
    );
  }
}
