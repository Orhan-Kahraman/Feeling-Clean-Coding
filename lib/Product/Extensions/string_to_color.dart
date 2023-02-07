import 'package:flutter/material.dart';

extension ColorToStringExtension on String {
  Color get colorName {
    var parsingColor = replaceFirst("#", "0xff");
    return Color(int.tryParse(parsingColor) ?? 0xffff0000);
  }
}
