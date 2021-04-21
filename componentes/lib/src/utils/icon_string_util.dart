import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'flare_rounded': Icons.flare_rounded,
  'input_rounded': Icons.input_rounded,
  'sync_alt_outlined': Icons.sync_alt_outlined,
  'list_alt_rounded': Icons.list_alt_rounded
};

Icon getIcon({String iconName, Color color = Colors.blue}) =>
    Icon(_icons[iconName], color: color);
