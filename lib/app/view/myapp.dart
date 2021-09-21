import 'package:agendadecontatos/app/models/controller.dart';
import 'package:agendadecontatos/app/view/contacts_detail.dart';
import 'package:agendadecontatos/app/view/myhomepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'form_contacts.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Controller>(
          create: (_) => Controller(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/contacts-detail': (context) => ContactsDetail(),
          '/form-contact': (context) => FormContacts(),
        },
        home: MyHomePage(),
      ),
    );
  }
}
