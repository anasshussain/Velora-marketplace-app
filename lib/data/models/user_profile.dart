import 'package:flutter/foundation.dart';

@immutable
class UserProfile {
  const UserProfile({
    required this.name,
    required this.email,
    required this.subtitle,
    required this.avatar,
    required this.balance,
  });

  final String name;
  final String email;
  final String subtitle;
  final String avatar;
  final String balance;
}
