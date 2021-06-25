import 'package:estudo_hive/repositories/hive/hive_repository.dart';
import 'package:estudo_hive/shared/models/agenda.dart';
import 'package:estudo_hive/shared/models/contact.dart';

class ContactService {
  HiveRepository _hiveRepository = HiveRepository();

  Future<List<Contact>> getContacts() async {
    final Agenda? _agenda = await _hiveRepository.loadAgenda();

    if (_agenda != null) {
      return _agenda.contacts;
    }

    return [];
  }

  void addContact(Contact contact) {
    _hiveRepository.addContact(contact);
  }
}
