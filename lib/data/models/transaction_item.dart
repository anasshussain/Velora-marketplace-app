import 'package:flutter/foundation.dart';

@immutable
class TransactionItem {
  const TransactionItem({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.method,
  });

  final String id;
  final String title;
  final String date;
  final String amount;
  final String method;
}
