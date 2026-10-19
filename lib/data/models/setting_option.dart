import 'package:flutter/material.dart';

@immutable
class SettingOption {
  const SettingOption({
    required this.id,
    required this.title,
    required this.icon,
    this.isToggle = false,
  });

  final String id;
  final String title;
  final IconData icon;
  final bool isToggle;
}
