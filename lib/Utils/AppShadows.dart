import 'package:flutter/material.dart';

class AppShadows {
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black12,
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> drawerHeaderShadow = [
    BoxShadow(
      color: Colors.black12,
      offset: Offset(0, 2),
      blurRadius: 6,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> elevatedShadow = [
    BoxShadow(
      color: Colors.black12,
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];
}