import 'package:estudo_hive/shared/models/contact.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveRepository {
  static void initialize() async {
    Hive.registerAdapter(ContactAdapter());
    await Hive.initFlutter();
    await Hive.openBox<Contact>('contacts');
  }

  Future<Box<Contact>> getContactsBox() async {
    if (Hive.isBoxOpen('contacts')) {
      return Hive.box<Contact>('contacts');
    }

    return _openContactsBox();
  }

  Future<void> addContact(Contact contact) async {
    var box = await getContactsBox();
    box.put('contacts', contact);
  }

  Future<Box<Contact>> _openContactsBox() async {
    return await Hive.openBox<Contact>('contacts');
  }
}
