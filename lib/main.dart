import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:contact_bloc/features/bloc_example/bloc_freezed/example_freezed_bloc.dart';
import 'package:contact_bloc/features/contacts/repositories/contact_repository.dart';
import 'package:contact_bloc/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/bloc_example/bloc_example.dart';
import 'features/bloc_example/bloc_example_freezed.dart';
import 'features/contacts/bloc/contact_list_bloc.dart';
import 'features/contacts/list/contacts_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ContactRepository(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home',
        routes: {
          '/home': (_) => const HomePage(),
          '/example': (_) => BlocProvider(
                create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
                child: const BlocExample(),
              ),
          '/freezed': (context) => BlocProvider(
                create: (context) => ExampleFreezedBloc()..add(ExampleFreezedEvent.findName()),
                child: const BlocExampleFreezed(),
              ),
          '/contact': (context) => BlocProvider(
                create: (_) => ContactListBloc(repository: context.read<ContactRepository>())
                  ..add(
                    ContactListEvent.findAll(),
                  ),
                child: const ContactsListPage(),
              ),
        },
      ),
    );
  }
}
