// ignore: file_names
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, file_names, non_constant_identifier_names, unnecessary_this, duplicate_ignore, must_be_immutable, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_new, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:jor_final_project/MyToastMessage.dart';
import 'package:jor_final_project/deleteContact.dart';
import 'package:jor_final_project/main.dart';
import 'package:jor_final_project/listViewPhone.dart';
import 'package:jor_final_project/updateContact.dart';

class ContactDetails extends StatelessWidget {
  final ListViewPhoneState state = ListViewPhoneState();

  late String contact_name;
  late String contact_occupation;
  late String contact_phone;
  late String contact_address;
  late String contact_email;

  var counter = 0;
  late int position;

  ContactDetails(this.position);

  @override
  Widget build(BuildContext context) {
    for (var element in Main.listModel) {
      if (counter == position) {
        this.contact_name = element.name;
        this.contact_occupation = element.occupation;
        this.contact_phone = element.phone;
        this.contact_address = element.address;
        this.contact_email = element.email;
        break;
      }
      counter++;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Main()),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 25),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTapDown: (TapDownDetails details) {
                    showPopupMenu(context, details.globalPosition, position);
                  },
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 40,
                  child: Image.asset(
                    'assets/images/default_image.png',
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 200,
                ),
                Text(
                  contact_name,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Text(
                  contact_occupation,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  width: 200,
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: MaterialButton(
                                        onPressed: () => showToasMessage('Call is unavailable at this moment.'),
                                        color: Colors.white70,
                                        textColor: Colors.black,
                                        child: Icon(
                                          Icons.call_outlined,
                                          size: 24,
                                        ),
                                        padding: EdgeInsets.all(16),
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                    Text('Call')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: MaterialButton(
                                        onPressed: () => showToasMessage('Message is unavailable at this moment.'),
                                        color: Colors.white70,
                                        textColor: Colors.black,
                                        child: Icon(
                                          Icons.message_outlined,
                                          size: 24,
                                        ),
                                        padding: EdgeInsets.all(16),
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                    Text('Message')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: MaterialButton(
                                        onPressed: () => showToasMessage('Video is unavailable at this moment.'),
                                        color: Colors.white70,
                                        textColor: Colors.black,
                                        child: Icon(
                                          Icons.video_call_outlined,
                                          size: 24,
                                        ),
                                        padding: EdgeInsets.all(16),
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                    Text('Video')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                      title: Text(
                        contact_phone,
                      ),
                    )),
                Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.location_city,
                        color: Colors.black,
                      ),
                      title: Text(
                        contact_address,
                      ),
                    )),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    title: Text(
                      contact_email,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void showPopupMenu(BuildContext context, Offset offset, int i) async {
    final ListViewPhone listViewPhone = ListViewPhone();

    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        PopupMenuItem<String>(child: const Text('Edit', style: TextStyle(fontSize: 15),), value: '1'),
        PopupMenuItem<String>(child: const Text('Delete', style: TextStyle(fontSize: 15),), value: '2'),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value == "1") {
        updateModal(context, i);
      } else if (value == "2") {
        deleteModal(context, i);
      }
    });
  }
}
