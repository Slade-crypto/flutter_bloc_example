import 'package:contact_bloc/features/contacts/models/contact_model.dart';
import 'package:dio/dio.dart';

class ContactRepository {
  Future<List<Contacts>> findAll() async {
    final response = await Dio().get('http://localhost:3031/contacts');

    return response.data?.map<Contacts>((contact) => Contacts.fromMap(contact)).toList();
  }

  Future<void> create(Contacts model) => Dio().post('http://127.0.0.1:3031/contacts', data: model.toMap());

  Future<void> update(Contacts model) => Dio().put(
        'http://127.0.0.1:3031/contacts/${model.id}',
        data: model.toMap(),
      );
  Future<void> delete(Contacts model) => Dio().delete(
        'http://127.0.0.1:3031/contacts/${model.id}',
        data: model.toMap(),
      );
}
