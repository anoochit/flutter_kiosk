// TODO : Create order model
// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.id,
    this.status,
    this.table,
    this.type,
    this.total,
    this.items,
  });

  final int? id;
  final String? status;
  final String? table;
  final String? type;
  final int? total;
  final List<Item>? items;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"] == null ? null : json["id"],
        status: json["status"] == null ? null : json["status"],
        table: json["table"] == null ? null : json["table"],
        type: json["type"] == null ? null : json["type"],
        total: json["total"] == null ? null : json["total"],
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "status": status == null ? null : status,
        "table": table == null ? null : table,
        "type": type == null ? null : type,
        "total": total == null ? null : total,
        "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.food,
    this.qt,
    this.price,
  });

  final int? id;
  final Food? food;
  final int? qt;
  final int? price;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"] == null ? null : json["id"],
        food: json["food"] == null ? null : Food.fromJson(json["food"]),
        qt: json["qt"] == null ? null : json["qt"],
        price: json["price"] == null ? null : json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "food": food == null ? null : food!.toJson(),
        "qt": qt == null ? null : qt,
        "price": price == null ? null : price,
      };
}

class Food {
  Food({
    this.id,
    this.title,
    this.description,
    this.price,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  final int? id;
  final String? title;
  final String? description;
  final double? price;
  final DateTime? publishedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Image? image;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "price": price == null ? null : price,
        "published_at": publishedAt == null ? null : publishedAt!.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "image": image == null ? null : image!.toJson(),
      };
}

class Image {
  Image({
    this.url,
  });

  final String? url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
      };
}
