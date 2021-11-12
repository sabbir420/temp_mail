// To parse this JSON data, do
//
//     final signupErrorModel = signupErrorModelFromJson(jsonString);

import 'dart:convert';

SignupErrorModel signupErrorModelFromJson(String str) => SignupErrorModel.fromJson(json.decode(str));

String signupErrorModelToJson(SignupErrorModel data) => json.encode(data.toJson());

class SignupErrorModel {
    SignupErrorModel({
        required this.context,
        required this.type,
        required this.hydraTitle,
        required this.hydraDescription,
        required this.violations,
    });

    String context;
    String type;
    String hydraTitle;
    String hydraDescription;
    List<Violation> violations;

    factory SignupErrorModel.fromJson(Map<String, dynamic> json) => SignupErrorModel(
        context: json["@context"],
        type: json["@type"],
        hydraTitle: json["hydra:title"],
        hydraDescription: json["hydra:description"],
        violations: List<Violation>.from(json["violations"].map((x) => Violation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "@context": context,
        "@type": type,
        "hydra:title": hydraTitle,
        "hydra:description": hydraDescription,
        "violations": List<dynamic>.from(violations.map((x) => x.toJson())),
    };
}

class Violation {
    Violation({
        required this.propertyPath,
        required this.message,
        required this.code,
    });

    String propertyPath;
    String message;
    String code;

    factory Violation.fromJson(Map<String, dynamic> json) => Violation(
        propertyPath: json["propertyPath"],
        message: json["message"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "propertyPath": propertyPath,
        "message": message,
        "code": code,
    };
}
