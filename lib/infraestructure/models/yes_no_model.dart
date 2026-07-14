// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

// import 'dart:convert';

// YesNoModel yesNoModelFromJson(String str) =>
//     YesNoModel.fromJson(json.decode(str));//esto es por si recibimos la data como un string, usualmente el paquete de http me genera el string, entonces esta funcion transforma ee string a un mapa y con ese llamar a ese fromjson

// String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson()); //teniendo una instancia de YesNoModel, esta funcion la convierte a un string json

import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
    answer: json["answer"],
    forced: json["forced"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "answer": answer,
    "forced": forced,
    "image": image,
  };

  Message toMessageEntity() => Message(
    text: answer == 'yes' ? 'Sin lugar a dudas' : 'No :)',
    fromWho: FromWho.hers,
    imageUrl: image,
  );
}

// class YesNoModel {
//   String answer;
//   String image;
//   bool forced;

//   YesNoModel({required this.answer, required this.image, this.forced = false});

//   factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
//     answer: json['answer'] as String,
//     image: json['image'] as String,
//     forced: json['forced'] as bool? ?? false,
//   );
// }
