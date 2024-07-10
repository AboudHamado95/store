// To parse this JSON data, do
//
//     final offersModel = offersModelFromJson(jsonString);

import 'dart:convert';

OffersModel offersModelFromJson(String str) => OffersModel.fromJson(json.decode(str));

String offersModelToJson(OffersModel data) => json.encode(data.toJson());

class OffersModel {
    final bool? success;
    final Content? content;
    final String? message;
    final int? status;

    OffersModel({
        this.success,
        this.content,
        this.message,
        this.status,
    });

    factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
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
    final List<Offer>? offers;
    final int? currentPage;
    final int? perPage;
    final int? lastPage;
    final int? total;

    Content({
        this.offers,
        this.currentPage,
        this.perPage,
        this.lastPage,
        this.total,
    });

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        offers: json["offers"] == null ? [] : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
        currentPage: json["currentPage"],
        perPage: json["perPage"],
        lastPage: json["lastPage"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "offers": offers == null ? [] : List<dynamic>.from(offers!.map((x) => x.toJson())),
        "currentPage": currentPage,
        "perPage": perPage,
        "lastPage": lastPage,
        "total": total,
    };
}

class Offer {
    final int? id;
    final String? title;
    final String? description;
    final int? likes;
    final int? reviews;
    final int? rate;
    final List<dynamic>? gallery;

    Offer({
        this.id,
        this.title,
        this.description,
        this.likes,
        this.reviews,
        this.rate,
        this.gallery,
    });

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        likes: json["likes"],
        reviews: json["reviews"],
        rate: json["rate"],
        gallery: json["gallery"] == null ? [] : List<dynamic>.from(json["gallery"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "likes": likes,
        "reviews": reviews,
        "rate": rate,
        "gallery": gallery == null ? [] : List<dynamic>.from(gallery!.map((x) => x)),
    };
}
