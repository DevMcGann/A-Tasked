// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';


Entidad welcomeFromJson(String str) => Entidad.fromJson(json.decode(str));

String welcomeToJson(Entidad data) => json.encode(data.toJson());

class Entidad {
    Entidad({
        this.id,
        this.name,
    });

    int id;
    String name;


    factory Entidad.fromJson(Map<String, dynamic> json) => Entidad(
        id: json["id"],
        name: json["name"],     
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}


