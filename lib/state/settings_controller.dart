import 'package:flutter/foundation.dart';

/// Settings toggles ka state.
class SettingsController extends ValueNotifier<Map<String, bool>> {
  SettingsController._()
      : super(const {'incentives': false, 'notification': true});

  static final SettingsController instance = SettingsController._();

  bool isOn(String id) => value[id] ?? false;

  void toggle(String id, bool next) {
    value = {...value, id: next};
  }
}
