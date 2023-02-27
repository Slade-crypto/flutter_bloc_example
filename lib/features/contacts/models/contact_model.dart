import 'dart:convert';

class Contacts {
  final String? id;
  final String name;
  final String email;

  Contacts({
    this.id,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
    };
  }

  factory Contacts.fromMap(Map<String, dynamic> map) {
    return Contacts(
      id: map["id"],
      name: map["name"] ?? '',
      email: map["email"] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Contacts.fromJson(String json) => Contacts.fromMap(jsonDecode(json));
}
