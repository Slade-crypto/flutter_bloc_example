import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:contact_bloc/features/contacts/models/contact_model.dart';
import 'package:contact_bloc/features/contacts/repositories/contact_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_register_bloc.freezed.dart';
part 'contact_register_state.dart';
part 'contact_register_event.dart';

class ContactRegisterBloc extends Bloc<ContactRegisterEvent, ContactRegisterState> {
  final ContactRepository _contactsRepository;

  ContactRegisterBloc({required ContactRepository repository})
      : _contactsRepository = repository,
        super(const ContactRegisterState.initial()) {
    on<_Save>(_save);
  }

  FutureOr<void> _save(_Save event, Emitter<ContactRegisterState> emit) async {
    try {
      emit(const ContactRegisterState.loading());
      final contactModel = Contacts(
        name: event.name,
        email: event.email,
      );

      await _contactsRepository.create(contactModel);
      emit(const ContactRegisterState.succes());
    } catch (e, s) {
      log("Erro ao cadastrar contado", error: e, stackTrace: s);
      emit(const ContactRegisterState.error(errorMessage: 'Erro ao cadastrar contato'));
    }
  }
}
