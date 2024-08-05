// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  List<Order>? orders;

  OrderModel({
    this.orders,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orders: json["orders"] == null
            ? []
            : List<Order>.from(json["orders"]!.map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders": orders == null
            ? []
            : List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class Order {
  String? order;
  String? status;
  String? price;
  String? location;

  Order({
    this.order,
    this.status,
    this.price,
    this.location,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        order: json["order"],
        status: json["status"],
        price: json["price"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "order": order,
        "status": status,
        "price": price,
        "location": location,
      };
}
