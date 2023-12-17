import 'dart:convert';

class Kriterij {
  late int kriterijId;
  late String naziv;
  late String vrijednost;
  late int kategorijaId;
  late dynamic kategorija;

  Kriterij(
    
  );

  Kriterij.full(
    this.kriterijId,
    this.naziv,
    this.vrijednost,
    this.kategorijaId,
    this.kategorija,
  );

  factory Kriterij.fromJson(Map<String, dynamic> map) {
    return Kriterij.full(
      map['kriterijId'],
      map['naziv'],
      map['vrijednost'],
      map['kategorijaId'],
      map['kategorija'],
    );
  }

  static Kriterij kriterijFromJson(String json) {
    final data = const JsonDecoder().convert(json);
    return Kriterij.fromJson(data);
  }
}
