import 'dart:async';

import 'package:qrapp/src/models/scan_model.dart';

class Validators {
  final validateGeo =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (scans, sink) {
      final geoScans = scans.where((scan) => scan.type == 'geo').toList();
      sink.add(geoScans);
    },
  );

  final validateWeb =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (scans, sink) {
      final webScans = scans.where((scan) => scan.type == 'web').toList();
      sink.add(webScans);
    },
  );
}
