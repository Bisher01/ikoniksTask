import '../../domain/entities/device_entity.dart';

class DeviceListModel extends DeviceListEntity {
  const DeviceListModel({
    required int total,
    required int skip,
    required int? limit,
    required List<DeviceModel> results,
  }) : super(
          total: total,
          skip: skip,
          limit: limit,
          results: results,
        );

  factory DeviceListModel.fromJson(Map<String, dynamic> json) {
    return DeviceListModel(
      total: json['total'],
      skip: json['skip'],
      limit: json['limit']??0,
      results: (json['products'] as List)
          .map((e) => DeviceModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    if (results.isNotEmpty) {
      data['products'] =
          (results as List<DeviceModel>).map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class DeviceModel extends DeviceEntity {
  const DeviceModel({
    required int id,
    required String title,
    required String description,
    required int price,
    required double discountPercentage,
    required double rating,
    required int stock,
    required String brand,
    required String category,
    required String thumbnail,
    required List<String> images,
  }) : super(
    id: id,
    title: title,
    description: description,
    price: price,
    discountPercentage: discountPercentage,
    rating: rating,
    stock: stock,
    brand: brand,
    category: category,
    thumbnail: thumbnail,
    images: images,
  );

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        discountPercentage: json['discountPercentage'].toDouble(),
        rating: json['rating'].toDouble(),
        stock: json['stock'],
        brand: json['brand'],
        category: json['category'],
        thumbnail: json['thumbnail'],
        images: (json['images'] as List).map((e) => e.toString()).toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    data['rating'] = rating;
    data['stock'] = stock;
    data['brand'] = brand;
    data['category'] = category;
    data['thumbnail'] = thumbnail;
    data['images'] = images;
    return data;
  }
}

