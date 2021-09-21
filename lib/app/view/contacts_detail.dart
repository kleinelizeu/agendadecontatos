import 'package:agendadecontatos/app/models/contact_model.dart';
import 'package:agendadecontatos/app/models/controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ContactsDetail extends StatefulWidget {
  @override
  _ContactsDetailState createState() => _ContactsDetailState();
}

class _ContactsDetailState extends State<ContactsDetail> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);
    final model = ModalRoute.of(context).settings.arguments as ContactModel;

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
              onPressed: () {
                controller.removeContact(model);
                print(controller.listContacts.length);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/form-contact');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[600],
              child: Icon(Icons.person, color: Colors.grey[400], size: 50),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              model.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "22 ${model.cellphone}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Celular | Rio de Janeiro",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 20,
                      child: IconButton(
                        icon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 20,
                      child: IconButton(
                        icon: Icon(
                          Icons.comment,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "WhatsApp",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Divider(
              color: Colors.grey[900],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Histórico de chamadas",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 180,
            ),
            GestureDetector(
              child: Text(
                "Excluir contato",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                controller.removeContact(model);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
