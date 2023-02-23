import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleStateInitial()) {
    on<ExampleFindNameEvent>(_findNames);
  }

  FutureOr<void> _findNames(ExampleFindNameEvent event, Emitter<ExampleState> emit) async {
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
