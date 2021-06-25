import 'package:estudo_hive/services/contact/contact_service.dart';
import 'package:estudo_hive/shared/models/contact.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final ContactService _contactService = ContactService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Contact>>(
      future: _contactService.getContacts(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        var contactList = snapshot.data;

        if (contactList == null) {
          return CircularProgressIndicator();
        }

        return SingleChildScrollView(
          child: ListView.builder(
            itemCount: contactList.length,
            shrinkWrap: true,
            itemBuilder: (_, i) {
              return ListTile(
                title: Text(contactList[i].name),
                subtitle: Text(contactList[i].phoneNumber),
              );
            },
          ),
        );
      },
    );
  }
}
