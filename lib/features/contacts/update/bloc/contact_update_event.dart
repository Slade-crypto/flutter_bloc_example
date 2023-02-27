part of 'contact_update_bloc.dart';

@freezed
class ContactUpdateEvent with _$ContactUpdateEvent {
  factory ContactUpdateEvent.update() = _ContactUpdateEventUpdate;
}
