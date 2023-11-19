// To parse this JSON data, do
//
//     final balance = balanceFromJson(jsonString);

import 'dart:convert';

Balance balanceFromJson(String str) => Balance.fromJson(json.decode(str));

String balanceToJson(Balance data) => json.encode(data.toJson());

class Balance {
    int? totalDeposit;
    int? totalPurchase;
    int? totalOrder;
    dynamic lastOrder;

    Balance({
        this.totalDeposit,
        this.totalPurchase,
        this.totalOrder,
        this.lastOrder,
    });

    factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        totalDeposit: json["total_deposit"],
        totalPurchase: json["total_purchase"],
        totalOrder: json["total_order"],
        lastOrder: json["last_order"],
    );

    Map<String, dynamic> toJson() => {
        "total_deposit": totalDeposit,
        "total_purchase": totalPurchase,
        "total_order": totalOrder,
        "last_order": lastOrder,
    };
}
