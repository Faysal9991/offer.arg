// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
    int? id;
    String? title;
    String? amount;
    String? offerId;
    String? userId;
    String? phoneNumber;
    String? paymentFrom;
    String? status;
    String? data;
    DateTime? createdAt;
    DateTime? updatedAt;

    OrderModel({
        this.id,
        this.title,
        this.amount,
        this.offerId,
        this.userId,
        this.phoneNumber,
        this.paymentFrom,
        this.status,
        this.data,
        this.createdAt,
        this.updatedAt,
    });

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        title: json["title"],
        amount: json["amount"],
        offerId: json["offer_id"],
        userId: json["user_id"],
        phoneNumber: json["phone_number"],
        paymentFrom: json["payment_from"],
        status: json["status"],
        data: json["data"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "amount": amount,
        "offer_id": offerId,
        "user_id": userId,
        "phone_number": phoneNumber,
        "payment_from": paymentFrom,
        "status": status,
        "data":data,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
