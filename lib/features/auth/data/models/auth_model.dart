// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    final bool? success;
    final Content? content;
    final String? message;
    final int? status;

    LoginModel({
        this.success,
        this.content,
        this.message,
        this.status,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        content: json["content"] == null ? null : Content.fromJson(json["content"]),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "content": content?.toJson(),
        "message": message,
        "status": status,
    };
}

class Content {
    final int? id;
    final String? name;
    final String? lastName;
    final String? email;
    final String? phone;
    final String? image;
    final City? city;
    final String? token;

    Content({
        this.id,
        this.name,
        this.lastName,
        this.email,
        this.phone,
        this.image,
        this.city,
        this.token,
    });

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "image": image,
        "city": city?.toJson(),
        "token": token,
    };
}

class City {
    final int? id;
    final String? name;

    City({
        this.id,
        this.name,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
