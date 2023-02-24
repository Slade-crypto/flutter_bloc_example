import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_freezed_state.dart';
part 'example_freezed_event.dart';
part 'example_freezed_bloc.freezed.dart';

class ExampleFreezedBloc extends Bloc<ExampleFreezedEvent, ExampleFreezedState> {
  ExampleFreezedBloc() : super(ExampleFreezedState.initial()) {
    on<_ExampleFindNameEvent>(_findNames);
    on<_ExampleRemoveNameEvent>(_removeName);
    on<_ExampleAddNameEvent>(_addName);
  }

  FutureOr<void> _removeName(_ExampleRemoveNameEvent event, Emitter<ExampleFreezedState> emit) {
    final names = state.maybeWhen(
      data: (names) => names,
      orElse: () => const <String>[],
    );

    final newNames = [...names];

    newNames.retainWhere((element) => element != event.name);
    emit(ExampleFreezedState.data(names: newNames));
  }

  FutureOr<void> _addName(_ExampleAddNameEvent event, Emitter<ExampleFreezedState> emit) {
    final names = state.maybeWhen(
      data: (names) => names,
      orElse: () => const <String>[],
    );

    emit(ExampleFreezedState.showBanner(names: names, message: 'Aguarde, nome sendo inserido...'));
    Future.delayed(const Duration(seconds: 2));

    final newNames = [...names];

    newNames.add(event.name);
    emit(ExampleFreezedState.data(names: names));
  }

  FutureOr<void> _findNames(_ExampleFindNameEvent event, Emitter<ExampleFreezedState> emit) async {
    emit(ExampleFreezedState.loading());
    final names = [
      'Renan',
      'Academia do flutter',
      'Flutter',
      'Dart',
      'Bloc',
    ];
    await Future.delayed(const Duration(seconds: 4));
    emit(ExampleFreezedState.data(names: names));
  }
}
