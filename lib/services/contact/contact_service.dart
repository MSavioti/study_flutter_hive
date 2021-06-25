import 'package:estudo_hive/repositories/hive/hive_repository.dart';
import 'package:estudo_hive/shared/models/contact.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ContactService {
  HiveRepository _hiveRepository = HiveRepository();

  Future<List<Contact>> getContacts() async {
    final Box<Contact> _contactsBox = await _hiveRepository.getContactsBox();
    return _contactsBox.values.toList();
  }
}
