import 'package:agendadecontatos/app/models/contact_model.dart';
import 'package:agendadecontatos/app/models/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ContactWidget extends StatelessWidget {
  final ContactModel model;

  const ContactWidget({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context, listen: false);
    return Observer(builder: (_) {
      return ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[600],
                  child: IconButton(
                    icon: Icon(
                      Icons.person,
                      color: Colors.grey[500],
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  model.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.grey[700],
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/contacts-detail', arguments: model);
                }),
          ],
        ),
      );
    });
  }
}
