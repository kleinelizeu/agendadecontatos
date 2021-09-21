import 'package:agendadecontatos/app/components/contact_widget.dart';
import 'package:agendadecontatos/app/models/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);
    Size size = MediaQuery.of(context).size;
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final heightScreen =
        MediaQuery.of(context).size.height - appBarHeight - statusBarHeight;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[900],
                child: IconButton(
                  icon: Icon(
                    Icons.phone,
                    color: Colors.grey[700],
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 70,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.grey[500],
                ),
                onPressed: () {}),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: heightScreen * 0.1,
                width: double.infinity,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: size.width * 0.035,
                  left: size.width * 0.035,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    color: Colors.grey[900],
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "234 contatos",
                        hintStyle: TextStyle(
                          color: Colors.grey[700],
                          fontSize: size.width * 0.045,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey[700],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                      ),
                      textCapitalization: TextCapitalization.characters,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.05,
              left: size.width * 0.05,
              top: size.height * 0.015,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: double.infinity,
                height: 50,
                color: Colors.lightBlueAccent.withOpacity(0.3),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Importar contatos do SIM",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.blue,
                            size: 20,
                          ),
                          onPressed: () {})
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.02,
            ),
            child: Row(
              children: [
                Text(
                  "Todos os contatos",
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: Colors.grey[600],
                      size: 15,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.grey[600],
                      size: 15,
                    ),
                  ],
                )
              ],
            ),
          ),
          FutureBuilder(
            future: controller.loadContacts(),
            builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: Observer(builder: (_) {
                          return ListView.builder(
                              itemCount: controller.listContacts.length,
                              itemBuilder: (_, index) {
                                var model = controller.listContacts[index];
                                return ContactWidget(
                                  model: model,
                                );
                              });
                        }),
                      ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          print(controller.listContacts.length);
          Navigator.of(context)
              .pushNamed('/form-contact', arguments: controller);
        },
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
