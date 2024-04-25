import 'dart:convert';

import 'package:test_flutter_angel_valdiviezo/src/models/models.dart';

class DigimonModel {
    List<DigiDataModel> content;
    Pageable pageable;

    DigimonModel({
        required this.content,
        required this.pageable,
    });

    factory DigimonModel.fromJson(String str) => DigimonModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DigimonModel.fromMap(Map<String, dynamic> json) => DigimonModel(
        content: List<DigiDataModel>.from(json["content"].map((x) => DigiDataModel.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
    );

    Map<String, dynamic> toMap() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable.toJson(),
    };
}
