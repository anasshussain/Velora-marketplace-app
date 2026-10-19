import 'package:flutter/foundation.dart';

@immutable
class PaymentCard {
  const PaymentCard({
    required this.id,
    required this.label,
    required this.balance,
    required this.last4,
    required this.expiry,
    required this.cvc,
    required this.network,
  });

  final String id;
  final String label;
  final String balance;
  final String last4;
  final String expiry;
  final String cvc;
  final String network;

  String get maskedNumber => '****  ****  ****  $last4';
}
