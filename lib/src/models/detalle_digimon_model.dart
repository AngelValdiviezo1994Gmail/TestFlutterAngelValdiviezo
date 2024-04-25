import 'dart:convert';

class DigimonDetalleModel {
    int id;
    String name;
    bool xAntibody;
    List<ImageDigimon> images;
    List<Level> levels;
    List<Type> types;
    List<Attribute> attributes;
    List<Field> fields;
    String releaseDate;
    List<Description> descriptions;
    List<Skill> skills;
    List<Evolution> priorEvolutions;
    List<Evolution> nextEvolutions;

    DigimonDetalleModel({
        required this.id,
        required this.name,
        required this.xAntibody,
        required this.images,
        required this.levels,
        required this.types,
        required this.attributes,
        required this.fields,
        required this.releaseDate,
        required this.descriptions,
        required this.skills,
        required this.priorEvolutions,
        required this.nextEvolutions,
    });


    String toRawJson() => json.encode(toJson());

    factory DigimonDetalleModel.fromJson(String str) => DigimonDetalleModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DigimonDetalleModel.fromMap(Map<String, dynamic> json) => DigimonDetalleModel(
        id: json["id"],
        name: json["name"],
        xAntibody: json["xAntibody"],
        images: List<ImageDigimon>.from(json["images"].map((x) => ImageDigimon.fromJson(x))),
        levels: List<Level>.from(json["levels"].map((x) => Level.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
        fields: List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
        releaseDate: json["releaseDate"],
        descriptions: List<Description>.from(json["descriptions"].map((x) => Description.fromJson(x))),
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        priorEvolutions: List<Evolution>.from(json["priorEvolutions"].map((x) => Evolution.fromJson(x))),
        nextEvolutions: List<Evolution>.from(json["nextEvolutions"].map((x) => Evolution.fromJson(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "xAntibody": xAntibody,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "levels": List<dynamic>.from(levels.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "fields": List<dynamic>.from(fields.map((x) => x.toJson())),
        "releaseDate": releaseDate,
        "descriptions": List<dynamic>.from(descriptions.map((x) => x.toJson())),
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "priorEvolutions": List<dynamic>.from(priorEvolutions.map((x) => x.toJson())),
        "nextEvolutions": List<dynamic>.from(nextEvolutions.map((x) => x.toJson())),
    };
}

class Attribute {
    int id;
    String attribute;

    Attribute({
        required this.id,
        required this.attribute,
    });

    factory Attribute.fromRawJson(String str) => Attribute.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        attribute: json["attribute"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attribute": attribute,
    };
}

class Description {
    String origin;
    String language;
    String description;

    Description({
        required this.origin,
        required this.language,
        required this.description,
    });

    factory Description.fromRawJson(String str) => Description.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Description.fromJson(Map<String, dynamic> json) => Description(
        origin: json["origin"],
        language: json["language"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "origin": origin,
        "language": language,
        "description": description,
    };
}

class Field {
    int id;
    String field;
    String image;

    Field({
        required this.id,
        required this.field,
        required this.image,
    });

    factory Field.fromRawJson(String str) => Field.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Field.fromJson(Map<String, dynamic> json) => Field(
        id: json["id"],
        field: json["field"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "field": field,
        "image": image,
    };
}

class ImageDigimon {
    String href;
    bool transparent;

    ImageDigimon({
        required this.href,
        required this.transparent,
    });

    factory ImageDigimon.fromRawJson(String str) => ImageDigimon.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ImageDigimon.fromJson(Map<String, dynamic> json) => ImageDigimon(
        href: json["href"],
        transparent: json["transparent"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "transparent": transparent,
    };
}

class Level {
    int id;
    String level;

    Level({
        required this.id,
        required this.level,
    });

    factory Level.fromRawJson(String str) => Level.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Level.fromJson(Map<String, dynamic> json) => Level(
        id: json["id"],
        level: json["level"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "level": level,
    };
}

class Evolution {
    int? id;
    String digimon;
    String condition;
    String image;
    String url;

    Evolution({
        this.id,
        required this.digimon,
        required this.condition,
        required this.image,
        required this.url,
    });

    factory Evolution.fromRawJson(String str) => Evolution.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        id: json["id"],
        digimon: json["digimon"],
        condition: json["condition"],
        image: json["image"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "digimon": digimon,
        "condition": condition,
        "image": image,
        "url": url,
    };
}

class Skill {
    int id;
    String skill;
    String translation;
    String description;

    Skill({
        required this.id,
        required this.skill,
        required this.translation,
        required this.description,
    });

    factory Skill.fromRawJson(String str) => Skill.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        skill: json["skill"],
        translation: json["translation"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "skill": skill,
        "translation": translation,
        "description": description,
    };
}

class Type {
    int id;
    String type;

    Type({
        required this.id,
        required this.type,
    });

    factory Type.fromRawJson(String str) => Type.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
    };
}
