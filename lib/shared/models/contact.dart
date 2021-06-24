class Contact {
  String name = '';
  String phoneNumber = '';

  Contact({
    required this.name,
    required this.phoneNumber,
  });

  @override
  String toString() {
    return 'Name: $name\nPhone: $phoneNumber';
  }
}
