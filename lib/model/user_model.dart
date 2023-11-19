// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String? username;
    String? email;
    String? phoneNumber;
    String? uid;
    String? balance;
    String? isLogin;

    UserModel({
        this.username,
        this.email,
        this.phoneNumber,
        this.uid,
        this.balance,
        this.isLogin,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        uid: json["uid"],
        balance: json["balance"],
        isLogin: json["isLogin"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "phoneNumber": phoneNumber,
        "uid": uid,
        "balance": balance,
        "isLogin": isLogin,
    };
}
