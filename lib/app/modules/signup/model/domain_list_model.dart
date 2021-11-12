// To parse this JSON data, do
//
//     final domainListModel = domainListModelFromJson(jsonString);

import 'dart:convert';

DomainListModel domainListModelFromJson(String str) => DomainListModel.fromJson(json.decode(str));

String domainListModelToJson(DomainListModel data) => json.encode(data.toJson());

class DomainListModel {
    DomainListModel({
        required this.context,
        required this.id,
        required this.type,
        required this.hydraMember,
        required this.hydraTotalItems,
    });

    String context;
    String id;
    String type;
    List<HydraMember> hydraMember;
    int hydraTotalItems;

    factory DomainListModel.fromJson(Map<String, dynamic> json) => DomainListModel(
        context: json["@context"],
        id: json["@id"],
        type: json["@type"],
        hydraMember: List<HydraMember>.from(json["hydra:member"].map((x) => HydraMember.fromJson(x))),
        hydraTotalItems: json["hydra:totalItems"],
    );

    Map<String, dynamic> toJson() => {
        "@context": context,
        "@id": id,
        "@type": type,
        "hydra:member": List<dynamic>.from(hydraMember.map((x) => x.toJson())),
        "hydra:totalItems": hydraTotalItems,
    };
}

class HydraMember {
    HydraMember({
        required this.id,
        required this.type,
        required this.hydraMemberId,
        required this.domain,
        required this.isActive,
        required this.isPrivate,
        required this.createdAt,
        required this.updatedAt,
    });

    String id;
    String type;
    String hydraMemberId;
    String domain;
    bool isActive;
    bool isPrivate;
    DateTime createdAt;
    DateTime updatedAt;

    factory HydraMember.fromJson(Map<String, dynamic> json) => HydraMember(
        id: json["@id"],
        type: json["@type"],
        hydraMemberId: json["id"],
        domain: json["domain"],
        isActive: json["isActive"],
        isPrivate: json["isPrivate"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": type,
        "id": hydraMemberId,
        "domain": domain,
        "isActive": isActive,
        "isPrivate": isPrivate,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
