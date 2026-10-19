import 'package:flutter/foundation.dart';

@immutable
class AppNotification {
  const AppNotification({
    required this.id,
    required this.date,
    required this.time,
    required this.message,
  });

  final String id;
  final String date;
  final String time;
  final String message;

  String get meta => '$date  •  $time';
}
