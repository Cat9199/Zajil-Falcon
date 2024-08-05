// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'dart:convert';

MenuModel menuModelFromJson(String str) => MenuModel.fromJson(json.decode(str));

String menuModelToJson(MenuModel data) => json.encode(data.toJson());

class MenuModel {
  List<Product>? products;

  MenuModel({
    this.products,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  String? name;
  String? price;
  String? ingredients;
  String? category;
  String? stock;

  Product({
    this.name,
    this.price,
    this.ingredients,
    this.category,
    this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        price: json["price"],
        ingredients: json["ingredients"],
        category: json["category"],
        stock: json["stock"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "ingredients": ingredients,
        "category": category,
        "stock": stock,
      };
}
