import 'package:flutter/material.dart';

class Product {
  late String id;
  late String name;
  late String type;
  late String description;
  late String image;
  late num price;
  late int quantity;
  Product(
      {required this.name,
      required this.type,
      required this.description,
      required this.image,
      required this.price,
      required this.quantity});
  Product.formMap(Map<String, dynamic> map) {
    name = map["name"];
    type = map["type"];
    description = map["description"];
    image = map["image"];
    price = map["price"];
    quantity = map["quantity"];
  }
  toMap() {
    return {
      "name": name,
      "type": type,
      "description": description,
      "image": image,
      "price": price,
      "quantity": quantity,
    };
  }
}
