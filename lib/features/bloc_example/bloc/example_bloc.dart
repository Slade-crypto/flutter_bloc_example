import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleStateInitial()) {
    on<ExampleFindNameEvent>(_findNames);
    on<ExampleRemoveNameEvent>(_removeName);
    on<ExampleAddNameEvent>(_addName);
  }

  FutureOr<void> _removeName(
      ExampleRemoveNameEvent event, Emitter<ExampleState> emit) {
    final exampleState = state;

    if (exampleState is ExampleStateData) {
      final names = [...exampleState.names];
      names.retainWhere((element) => element != event.name);
      emit(ExampleStateData(names: names));
    }
  }

  FutureOr<void> _addName(
      ExampleAddNameEvent event, Emitter<ExampleState> emit) {
    final exampleState = state;
    if (exampleState is ExampleStateData) {
      const name = 'Pão';
      final names = exampleState.names;

      names.add(name);
      emit(ExampleStateData(names: names));
    }
  }

  FutureOr<void> _findNames(
      ExampleFindNameEvent event, Emitter<ExampleState> emit) async {
    final names = [
      'Renan',
      'Academia do flutter',
      'Flutter',
      'Dart',
      'Bloc',
    ];
    await Future.delayed(const Duration(seconds: 4));
    emit(ExampleStateData(names: names));
  }
}
