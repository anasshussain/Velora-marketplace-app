import 'package:flutter/foundation.dart';

/// Ek car ka immutable model.
@immutable
class Car {
  const Car({
    required this.id,
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.seats,
    required this.topSpeed,
    required this.power,
    required this.description,
    this.isPopular = true,
  });

  final String id;
  final String name;
  final String brand;
  final String image;
  final String price;
  final double rating;
  final int reviews;
  final String seats;
  final String topSpeed;
  final String power;
  final String description;
  final bool isPopular;

  Car copyWith({String? name, String? price}) => Car(
        id: id,
        name: name ?? this.name,
        brand: brand,
        image: image,
        price: price ?? this.price,
        rating: rating,
        reviews: reviews,
        seats: seats,
        topSpeed: topSpeed,
        power: power,
        description: description,
        isPopular: isPopular,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Car && other.id == id);

  @override
  int get hashCode => id.hashCode;
}
