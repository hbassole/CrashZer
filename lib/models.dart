import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

Future <List<Categorie>>loadcate()async{
  final response = await rootBundle.loadString("json/music.json");
  var fin=categorieFromJson(response);
  return fin;
}
Future <List<Musique>>loadmusic()async{
  final response = await rootBundle.loadString("json/music.json");
  var fin=musiqueFromJson(response);
  return fin;
}


List<Categorie> categorieFromJson(String str) => List<Categorie>.from(json.decode(str).map((x) => Categorie.fromJson(x)));
List<Musique> musiqueFromJson(String str) => List<Musique>.from(json.decode(str).map((x) => Musique.fromJson(x)));

class Categorie {
  int id;
  String nom;
  List<Musique> musique;

  Categorie({
    this.id,
    this.nom,
    this.musique,
  });

  factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
    id: json["id"],
    nom: json["nom"],
    musique: List<Musique>.from(json["musique"].map((x) => Musique.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": nom,
    "musique": List<dynamic>.from(musique.map((x) => x.toJson())),
  };
}

class Musique {
  int id;
  String nomArtiste;
  String titre;
  String description;
  String image;
  String lien;

  Musique({
    this.id,
    this.nomArtiste,
    this.titre,
    this.description,
    this.image,
    this.lien,
  });

  factory Musique.fromJson(Map<String, dynamic> json) => Musique(
    id: json["id"],
    nomArtiste: json["nom artiste"],
    titre: json["titre"],
    description: json["description"],
    image: json["image"],
    lien: json["lien"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom artiste": nomArtiste,
    "titre": titre,
    "description": description,
    "image": image,
    "lien": lien,
  };
}

