import 'dart:convert';

class Komisija {
  late int komisijaID;
  late String ime;
  late String prezime;
  late String email;
  late int kategorijaID;
  late int ulogaKomisijeID;

  Komisija(this.komisijaID, this.ime, this.prezime, this.email, this.kategorijaID,
      this.ulogaKomisijeID);

  factory Komisija.fromJson(Map<String, dynamic> map) {
    return Komisija(
        map['komisijaID'],
        map['ime'],
        map['prezime'],
        map['email'],
        map['kategorijaID'],
        map['ulogaKomisijeID']);
  }

  static Komisija DogadjajFromJson(String json) {
    final data = const JsonDecoder().convert(json);
    return Komisija.fromJson(data);
  }
}
