// To parse this JSON data, do
//
//     final tranjection = tranjectionFromJson(jsonString);

import 'dart:convert';

Tranjection tranjectionFromJson(String str) => Tranjection.fromJson(json.decode(str));

String tranjectionToJson(Tranjection data) => json.encode(data.toJson());

class Tranjection {
    int? id;
    String? amount;
    String? userId;
    String? paymentMethod;
    String? transictionId;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    Tranjection({
        this.id,
        this.amount,
        this.userId,
        this.paymentMethod,
        this.transictionId,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory Tranjection.fromJson(Map<String, dynamic> json) => Tranjection(
        id: json["id"],
        amount: json["amount"],
        userId: json["user_id"],
        paymentMethod: json["payment_method"],
        transictionId: json["transiction_id"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "user_id": userId,
        "payment_method": paymentMethod,
        "transiction_id": transictionId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
