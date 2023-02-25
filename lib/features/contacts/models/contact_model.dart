import 'dart:convert';

class Contact {
  final String? id;
  final String name;
  final String email;

  Contact(
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

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      map["id"] ?? '',
      map["name"] ?? '',
      map["email"] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Contact.fromJson(String json) => Contact.fromMap(jsonDecode(json));
}
