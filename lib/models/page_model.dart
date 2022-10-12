import 'package:flutter/material.dart';

class AppPage {
  AppPage({
    required this.id,
    required this.title,
    required this.widget,
    required this.color,
    required this.icon,
  });
  final String id;
  final Color color;
  final Widget widget;
  final String title;
  final IconData icon;
}
