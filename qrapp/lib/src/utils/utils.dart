import 'package:flutter/material.dart';
import 'package:qrapp/src/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(BuildContext context, ScanModel scan) async =>
    scan.type == 'web' ? await _launchURL(scan) : await _showGeo(context, scan);

Future<void> _showGeo(BuildContext context, ScanModel geo) async =>
    Navigator.pushNamed(context, 'map', arguments: geo);

Future<void> _launchURL(ScanModel web) async => await canLaunch(web.value)
    ? await launch(web.value)
    : throw 'Could not launch ${web.value}';
