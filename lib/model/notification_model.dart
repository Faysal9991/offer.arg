// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    String? id;
    String? type;
    String? notifiableType;
    String? notifiableId;
    Data? data;
    dynamic readAt;
    DateTime? createdAt;
    DateTime? updatedAt;

    NotificationModel({
        this.id,
        this.type,
        this.notifiableType,
        this.notifiableId,
        this.data,
        this.readAt,
        this.createdAt,
        this.updatedAt,
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json["id"],
        type: json["type"],
        notifiableType: json["notifiable_type"],
        notifiableId: json["notifiable_id"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        readAt: json["read_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "notifiable_type": notifiableType,
        "notifiable_id": notifiableId,
        "data": data?.toJson(),
        "read_at": readAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Data {
    String? message;

    Data({
        this.message,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
