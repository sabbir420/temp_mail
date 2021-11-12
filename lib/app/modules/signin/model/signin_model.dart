// To parse this JSON data, do
//
//     final signinModel = signinModelFromJson(jsonString);

import 'dart:convert';

SigninModel signinModelFromJson(String str) => SigninModel.fromJson(json.decode(str));

String signinModelToJson(SigninModel data) => json.encode(data.toJson());

class SigninModel {
    SigninModel({
        required this.token,
        required this.id,
    });

    String token;
    String id;

    factory SigninModel.fromJson(Map<String, dynamic> json) => SigninModel(
        token: json["token"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "id": id,
    };
}
