// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:store_app/features/orders/domain/entities/order_entity.dart';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

class OrderModel extends OrderEntity {
  final bool success;
  final List<Datum> data;
  final String message;

  const OrderModel({
    required this.success,
    required this.data,
    required this.message,
  }) : super(success: success, data: data, message: message);

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );
}

class Datum extends Equatable {
  final int id;
  final int userId;
  final int productId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;
  final Product product;

  const Datum({
    required this.id,
    required this.userId,
    required this.productId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.product,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
        product: Product.fromJson(json["product"]),
      );

  @override
  List<Object?> get props => [
        id,
        userId,
        productId,
        status,
        createdAt,
        updatedAt,
        user,
        product,
      ];
}

class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class User {
  final int id;
  final String name;
  final String email;
  final dynamic emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
