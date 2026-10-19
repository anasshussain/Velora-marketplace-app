import 'package:flutter/foundation.dart';

import '../data/models/car.dart';
import '../data/repositories/car_repository.dart';

/// Lightweight state management - zero external packages.
/// ValueListenableBuilder se consume karein.
class FavoritesController extends ValueNotifier<Set<String>> {
  FavoritesController._() : super(<String>{'tesla-model-3', 'tesla-model-x'});

  static final FavoritesController instance = FavoritesController._();

  bool isFavorite(String id) => value.contains(id);

  void toggle(String id) {
    final next = Set<String>.from(value);
    if (!next.remove(id)) next.add(id);
    value = next;
  }

  List<Car> get favorites => CarRepository.cars
      .where((car) => value.contains(car.id))
      .toList(growable: false);
}
