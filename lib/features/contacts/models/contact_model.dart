import 'dart:convert';

class Contacts {
  final String? id;
  final String name;
  final String email;

  Contacts(
    this.id,
    this.name,
    this.email,
  );

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
    };
  }

  factory Contacts.fromMap(Map<String, dynamic> map) {
    return Contacts(
      map["id"] ?? '',
      map["name"] ?? '',
      map["email"] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Contacts.fromJson(String json) => Contacts.fromMap(jsonDecode(json));
}
