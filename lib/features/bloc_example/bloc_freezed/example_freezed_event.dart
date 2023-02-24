part of 'example_freezed_bloc.dart';

@freezed
class ExampleFreezedEvent with _$ExampleFreezedEvent {
  factory ExampleFreezedEvent.findName() = _ExampleFindNameEvent;
  factory ExampleFreezedEvent.removeName(String name) = _ExampleRemoveNameEvent;
  factory ExampleFreezedEvent.addName(String name) = _ExampleAddNameEvent;
}
