import 'dart:async';

import 'package:qrapp/src/bloc/validators.dart';
import 'package:qrapp/src/models/scan_model.dart';
import 'package:qrapp/src/providers/db_provider.dart';

class ScansBloc with Validators {
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    //Obtener scans db
    getScans();
  }

  final _scansStreamController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansSreamGeo =>
      _scansStreamController.stream.transform(validateGeo);
  Stream<List<ScanModel>> get scansSreamWeb =>
      _scansStreamController.stream.transform(validateWeb);

  void dispose() {
    _scansStreamController?.close();
  }

  Future<void> addScan(ScanModel scan) async {
    await DBProvider.db.insertScan(scan);
    getScans();
  }

  Future<void> getScans() async {
    _scansStreamController.sink.add(await DBProvider.db.getScans());
  }

  Future<void> deleteScan(int id) async {
    await DBProvider.db.deleteScan(id);
    getScans();
  }

  Future<void> deleteAll() async {
    await DBProvider.db.deleteAll();
    getScans();
  }
}
