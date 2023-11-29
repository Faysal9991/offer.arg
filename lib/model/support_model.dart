// To parse this JSON data, do
//
//     final supportModel = supportModelFromJson(jsonString);

import 'dart:convert';

SupportModel supportModelFromJson(String str) => SupportModel.fromJson(json.decode(str));

String supportModelToJson(SupportModel data) => json.encode(data.toJson());

class SupportModel {
    Supports? supports;

    SupportModel({
        this.supports,
    });

    factory SupportModel.fromJson(Map<String, dynamic> json) => SupportModel(
        supports: json["supports"] == null ? null : Supports.fromJson(json["supports"]),
    );

    Map<String, dynamic> toJson() => {
        "supports": supports?.toJson(),
    };
}

class Supports {
    String? suppertMail;
    String? suppertNumber;
    String? supportTime;
    String? telegramGroup;
    String? telegramChannel;
    String? fbpage;
    String? fbgroup;

    Supports({
        this.suppertMail,
        this.suppertNumber,
        this.supportTime,
        this.telegramGroup,
        this.telegramChannel,
        this.fbpage,
        this.fbgroup,
    });

    factory Supports.fromJson(Map<String, dynamic> json) => Supports(
        suppertMail: json["suppert_mail"],
        suppertNumber: json["suppert_number"],
        supportTime: json["support_time"],
        telegramGroup: json["telegram_group"],
        telegramChannel: json["telegram_channel"],
        fbpage: json["fbpage"],
        fbgroup: json["fbgroup"],
    );

    Map<String, dynamic> toJson() => {
        "suppert_mail": suppertMail,
        "suppert_number": suppertNumber,
        "support_time": supportTime,
        "telegram_group": telegramGroup,
        "telegram_channel": telegramChannel,
        "fbpage": fbpage,
        "fbgroup": fbgroup,
    };
}
