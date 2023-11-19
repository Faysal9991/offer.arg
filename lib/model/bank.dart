// To parse this JSON data, do
//
//     final bankDetails = bankDetailsFromJson(jsonString);

import 'dart:convert';

BankDetails bankDetailsFromJson(String str) => BankDetails.fromJson(json.decode(str));

String bankDetailsToJson(BankDetails data) => json.encode(data.toJson());

class BankDetails {
    int? id;
    String? name;
    String? icon;
    String? color;
    String? instructions;
    String? number;
    String? status;
    DateTime? createdAt;
    dynamic updatedAt;

    BankDetails({
        this.id,
        this.name,
        this.icon,
        this.color,
        this.instructions,
        this.number,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        color: json["color"],
        instructions: json["instructions"],
        number: json["number"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "color": color,
        "instructions": instructions,
        "number": number,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
    };
}
