import 'package:contact_bloc/features/bloc_example/bloc_freezed/example_freezed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExampleFreezed extends StatelessWidget {
  const BlocExampleFreezed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Freezed'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ExampleFreezedBloc>().add(ExampleFreezedEvent.addName('Pão'));
        },
      ),
      body: BlocListener<ExampleFreezedBloc, ExampleFreezedState>(
        listener: (context, state) {
          state.maybeWhen(
            showBanner: (_, message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                ),
              );
            },
            orElse: () => null,
          );
        },
        child: Column(
          children: [
            BlocSelector<ExampleFreezedBloc, ExampleFreezedState, bool>(
              selector: (state) {
                return state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                );
              },
              builder: (context, showLoader) {
                if (showLoader) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.blueAccent,
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            BlocSelector<ExampleFreezedBloc, ExampleFreezedState, List<String>>(
              selector: (state) {
                return state.maybeWhen(
                  data: (names) => names,
                  showBanner: (names, _) => names,
                  orElse: () => <String>[],
                );
              },
              builder: (_, names) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    final name = names[index];
                    return ListTile(
                      onTap: () {},
                      title: Text(name),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
