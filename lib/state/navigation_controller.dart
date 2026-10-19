import 'package:flutter/foundation.dart';

/// Bottom navigation ka selected index.
class NavigationController extends ValueNotifier<int> {
  NavigationController._() : super(0);

  static final NavigationController instance = NavigationController._();

  void select(int index) {
    if (index != value) value = index;
  }
}
