import 'package:equatable/equatable.dart';

class DeviceListEntity extends Equatable {
  final int total;
  final int skip;
  final int? limit;
  final List<DeviceEntity> results;

  const DeviceListEntity({
    required this.total,
    required this.skip,
    this.limit,
    required this.results,
  });

  @override
  List<Object?> get props => [
        total,
        skip,
        limit,
        results,
      ];
}

class DeviceEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  const DeviceEntity(
      {required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.brand,
        required this.category,
        required this.thumbnail,
        required this.images});

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    price,
    discountPercentage,
    rating,
    stock,
    brand,
    category,
    thumbnail,
    images
  ];
}

