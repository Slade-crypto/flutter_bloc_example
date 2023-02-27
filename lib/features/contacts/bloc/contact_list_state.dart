part of 'contact_list_bloc.dart';

@freezed
class ContactListState with _$ContactListState {
  factory ContactListState.initial() = _ContactListStateInitial;
  factory ContactListState.loading() = _ContactListStateLoading;
  factory ContactListState.data({required List<Contacts> contacts}) = _ContactListStateData;
  factory ContactListState.error({required String errorMessage}) = _ContactListStateError;
}
