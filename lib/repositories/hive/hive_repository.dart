import 'package:estudo_hive/shared/models/contact.dart';
import 'package:estudo_hive/shared/models/agenda.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveRepository {
  static Future<void> initialize() async {
    Hive.registerAdapter(ContactAdapter());
    Hive.registerAdapter(AgendaAdapter());
    await Hive.initFlutter();
  }

  Future<Agenda?> loadAgenda() async {
    final Box<Agenda> _agendaBox = await _openAgendaBox();
    var agenda = _agendaBox.get('agenda');
    return agenda;
  }

  Future<void> addContact(Contact contact) async {
    var box = await _getAgendaBox();
    var agenda = box.get('agenda');

    if (agenda != null) {
      agenda.contacts.add(contact);
      _updateAgenda(agenda);
    }
  }

  Future<Box<Agenda>> _getAgendaBox() async {
    if (Hive.isBoxOpen('agenda')) {
      return Hive.box<Agenda>('agenda');
    }

    return _openAgendaBox();
  }

  Future<void> _updateAgenda(Agenda agenda) async {
    var box = await _getAgendaBox();
    await box.put('agenda', agenda);
  }

  Future<Box<Agenda>> _openAgendaBox() async {
    return await Hive.openBox<Agenda>('agenda');
  }
}
