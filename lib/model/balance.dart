
import 'dart:convert';

Balance balanceFromJson(String str) => Balance.fromJson(json.decode(str));

String balanceToJson(Balance data) => json.encode(data.toJson());

class Balance {
    String? balance;
    String? totalDeposit;
    String? totalPurchase;
    int? totalOrder;
    LastOrder? lastOrder;

    Balance({
        this.balance,
        this.totalDeposit,
        this.totalPurchase,
        this.totalOrder,
        this.lastOrder,
    });

    factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        balance: json["balance"],
        totalDeposit: json["total_deposit"],
        totalPurchase: json["total_purchase"],
        totalOrder: json["total_order"],
        lastOrder: json["last_order"] == null ? null : LastOrder.fromJson(json["last_order"]),
    );

    Map<String, dynamic> toJson() => {
        "balance": balance,
        "total_deposit": totalDeposit,
        "total_purchase": totalPurchase,
        "total_order": totalOrder,
        "last_order": lastOrder?.toJson(),
    };
}

class LastOrder {
    int? id;
    String? title;
    String? amount;
    String? offerId;
    String? userId;
    String? phoneNumber;
    String? paymentFrom;
    dynamic data;
    dynamic adminNote;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    LastOrder({
        this.id,
        this.title,
        this.amount,
        this.offerId,
        this.userId,
        this.phoneNumber,
        this.paymentFrom,
        this.data,
        this.adminNote,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory LastOrder.fromJson(Map<String, dynamic> json) => LastOrder(
        id: json["id"],
        title: json["title"],
        amount: json["amount"],
        offerId: json["offer_id"],
        userId: json["user_id"],
        phoneNumber: json["phone_number"],
        paymentFrom: json["payment_from"],
        data: json["data"],
        adminNote: json["admin_note"],
        status: json["status"],
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
        "data": data,
        "admin_note": adminNote,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
