

import 'dart:convert';

GamingOffer gamingOfferFromJson(String str) => GamingOffer.fromJson(json.decode(str));

String gamingOfferToJson(GamingOffer data) => json.encode(data.toJson());

class GamingOffer {
    int? id;
    String? oparator;
    String? title;
    String? ragularPrice;
    String? offerPrice;
    dynamic meyad;
    String? location;

    GamingOffer({
        this.id,
        this.oparator,
        this.title,
        this.ragularPrice,
        this.offerPrice,
        this.meyad,
        this.location,
    });

    factory GamingOffer.fromJson(Map<String, dynamic> json) => GamingOffer(
        id: json["id"],
        oparator: json["oparator"],
        title: json["title"],
        ragularPrice: json["ragular_price"],
        offerPrice: json["offer_price"],
        meyad: json["meyad"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "oparator": oparator,
        "title": title,
        "ragular_price": ragularPrice,
        "offer_price": offerPrice,
        "meyad": meyad,
        "location": location,
    };
}
