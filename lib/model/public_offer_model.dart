// To parse this JSON data, do
//
//     final publicOffer = publicOfferFromJson(jsonString);

import 'dart:convert';

PublicOffer publicOfferFromJson(String str) => PublicOffer.fromJson(json.decode(str));

String publicOfferToJson(PublicOffer data) => json.encode(data.toJson());

class PublicOffer {
    int? id;
    String? oparator;
    String? product;
    String? title;
    String? discount;
    String? ragularPrice;
    String? offerPrice;
    String? meyad;
    String? location;
    DateTime? validity;
    String? status;
    DateTime? createdAt;
    dynamic updatedAt;

    PublicOffer({
        this.id,
        this.oparator,
        this.product,
        this.title,
        this.discount,
        this.ragularPrice,
        this.offerPrice,
        this.meyad,
        this.location,
        this.validity,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory PublicOffer.fromJson(Map<String, dynamic> json) => PublicOffer(
        id: json["id"],
        oparator: json["oparator"],
        product: json["product"],
        title: json["title"],
        discount: json["discount"],
        ragularPrice: json["ragular_price"],
        offerPrice: json["offer_price"],
        meyad: json["meyad"],
        location: json["location"],
        validity: json["validity"] == null ? null : DateTime.parse(json["validity"]),
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "oparator": oparator,
        "product": product,
        "title": title,
        "discount": discount,
        "ragular_price": ragularPrice,
        "offer_price": offerPrice,
        "meyad": meyad,
        "location": location,
        "validity": validity?.toIso8601String(),
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
    };
}
