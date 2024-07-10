// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:store_app/features/products/domain/entities/products_entity.dart';


ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

class ProductsModel extends ProductsEntity {
  final bool success;
  final List<Datum> data;
  final String message;

  const ProductsModel({
    required this.success,
    required this.data,
    required this.message,
  }) : super(success: success, data: data, message: message);

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );
}

class Datum {
  final int id;
  final String title;
  final String description;
  final String image;
  final int comments;
  final double rate;
  final String createdAt;
  final String updatedAt;

  const Datum({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.comments,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        comments: json["comments"],
        rate: json["rate"]?.toDouble(),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
}
