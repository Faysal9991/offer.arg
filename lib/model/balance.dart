// To parse this JSON data, do
//
//     final balance = balanceFromJson(jsonString);

import 'dart:convert';

Balance balanceFromJson(String str) => Balance.fromJson(json.decode(str));

String balanceToJson(Balance data) => json.encode(data.toJson());

class Balance {
    String? totalDeposit;
    String? totalPurchase;
    String? totalOrder;
    dynamic lastOrder;

    Balance({
        this.totalDeposit,
        this.totalPurchase,
        this.totalOrder,
        this.lastOrder,
    });

    factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        totalDeposit: json["total_deposit"].toString(),
        totalPurchase: json["total_purchase"].toString(),
        totalOrder: json["total_order"].toString(),
        lastOrder: json["last_order"],
    );

    Map<String, dynamic> toJson() => {
        "total_deposit": totalDeposit,
        "total_purchase": totalPurchase,
        "total_order": totalOrder,
        "last_order": lastOrder,
    };
}
