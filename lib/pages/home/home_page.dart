import 'package:estudo_hive/pages/home/widgets/contact_form.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lime[100],
      appBar: AppBar(
        title: Text(
          'Hive DEMO',
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
      ),
      body: ContactForm(),
    );
  }
}
