// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    SignupModel({
        required this.context,
        required this.id,
        required this.type,
        required this.signupModelId,
        required this.address,
        required this.quota,
        required this.used,
        required this.isDisabled,
        required this.isDeleted,
        required this.createdAt,
        required this.updatedAt,
    });

    String context;
    String id;
    String type;
    String signupModelId;
    String address;
    int quota;
    int used;
    bool isDisabled;
    bool isDeleted;
    DateTime createdAt;
    DateTime updatedAt;

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        context: json["@context"],
        id: json["@id"],
        type: json["@type"],
        signupModelId: json["id"],
        address: json["address"],
        quota: json["quota"],
        used: json["used"],
        isDisabled: json["isDisabled"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "@context": context,
        "@id": id,
        "@type": type,
        "id": signupModelId,
        "address": address,
        "quota": quota,
        "used": used,
        "isDisabled": isDisabled,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}