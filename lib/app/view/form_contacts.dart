import 'package:agendadecontatos/app/models/contact_model.dart';
import 'package:agendadecontatos/app/models/controller.dart';
import 'package:flutter/material.dart';

class FormContacts extends StatefulWidget {
  @override
  _FormContactsState createState() => _FormContactsState();
}

class _FormContactsState extends State<FormContacts> {
  String dropdownValue = 'Celular';

  @override
  Widget build(BuildContext context) {
    final controller = ModalRoute.of(context).settings.arguments as Controller;
    var model = ContactModel();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Center(
          child: Text(
            "Editar contato",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
            ),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                controller.addContact(model);
                //  print(controller.listContacts);
                Navigator.of(context).pop();
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 30.0,
                bottom: 18.0,
              ),
              child: Center(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[900],
                  child: IconButton(
                    icon: Icon(
                      Icons.person,
                      color: Colors.grey[700],
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                color: Colors.grey[900],
                child: TextFormField(
                  onChanged: model.setName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                      isDense: true,
                      suffix: CircleAvatar(
                        backgroundColor: Colors.grey[800],
                        radius: 15,
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey[500],
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                  height: 150,
                  color: Colors.grey[900],
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton<String>(
                                dropdownColor: Colors.grey[900],
                                icon: Icon(Icons.keyboard_arrow_down_outlined),
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 18,
                                ),
                                underline: Container(
                                  color: Colors.grey[900],
                                ),
                                elevation: 50,
                                value: dropdownValue,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>[
                                  'Celular',
                                  'Comercial',
                                  'Casa',
                                  'Principal'
                                ]
                                    .map<DropdownMenuItem<String>>(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            ))
                                    .toList(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: VerticalDivider(color: Colors.grey[800]),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                height: 60,
                                width: 220,
                                color: Colors.grey[900],
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  onChanged: model.setCellPhone,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    isDense: true,
                                    suffix: CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: 15,
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(color: Colors.grey[800]),
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton<String>(
                                dropdownColor: Colors.grey[900],
                                icon: Icon(Icons.keyboard_arrow_down_outlined),
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 18),
                                underline: Container(
                                  color: Colors.grey[900],
                                ),
                                elevation: 50,
                                value: dropdownValue,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>[
                                  'Celular',
                                  'Comercial',
                                  'Casa',
                                  'Principal'
                                ]
                                    .map<DropdownMenuItem<String>>(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            ))
                                    .toList(),
                              ),
                            ),
                            VerticalDivider(color: Colors.grey[800]),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                height: 60,
                                width: 220,
                                color: Colors.grey[900],
                                child: TextFormField(
                                  onChanged: model.setPhone,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    isDense: true,
                                    suffix: CircleAvatar(
                                      backgroundColor: Colors.grey[800],
                                      radius: 15,
                                      child: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
