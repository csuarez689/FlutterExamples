import 'package:mapbox_gl/mapbox_gl.dart';

class ScanModel {
  ScanModel({
    this.id,
    this.type,
    this.value,
  }) {
    type = value.contains('http') ? 'web' : 'geo';
  }

  int id;
  String type;
  String value;

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "value": value,
      };

  LatLng getLatLng() {
    final latlng = value.substring(4).split(',');
    final lat = double.parse(latlng[0]);
    final lng = double.parse(latlng[1]);
    return LatLng(lat, lng);
  }
}
