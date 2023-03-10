import 'package:contact_bloc/features/contacts/bloc/contact_list_bloc.dart';
import 'package:contact_bloc/features/contacts/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/loader.dart';

class ContactsListPage extends StatelessWidget {
  const ContactsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, 'contact/register');
          context.read<ContactListBloc>().add(ContactListEvent.findAll());
        },
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async => context.read<ContactListBloc>()..add(ContactListEvent.findAll()),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: BlocListener<ContactListBloc, ContactListState>(
                listenWhen: (previous, current) {
                  return current.maybeWhen(
                    error: (errorMessage) => true,
                    orElse: () => false,
                  );
                },
                listener: (context, state) {
                  state.whenOrNull(
                    error: (errorMessage) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            errorMessage,
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                  );
                },
                child: Column(
                  children: [
                    Loader<ContactListBloc, ContactListState>(
                      selector: (state) {
                        return state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );
                      },
                    ),
                    BlocSelector<ContactListBloc, ContactListState, List<Contacts>>(
                      selector: (state) {
                        return state.maybeWhen(
                          data: (contacts) => contacts,
                          orElse: () => [],
                        );
                      },
                      builder: (_, contacts) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            final contact = contacts[index];
                            return ListTile(
                              onTap: () {
                                Navigator.pushNamed(context, 'contact/update');
                              },
                              title: Text(contact.name),
                              subtitle: Text(contact.email),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
