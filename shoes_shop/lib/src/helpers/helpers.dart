import 'package:flutter/services.dart' as services;

void lightStatusBar() {
  services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle.light);
}

void darkStatusBar() {
  services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle.dark);
}
