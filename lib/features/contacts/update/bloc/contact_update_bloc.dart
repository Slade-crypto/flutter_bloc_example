import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_update_bloc.freezed.dart';
part 'contact_update_event.dart';
part 'contact_update_state.dart';

class ContactUpdateBloc extends Bloc<ContactUpdateEvent, ContactUpdateState> {
  ContactUpdateBloc() : super(ContactUpdateState.initial());
}
