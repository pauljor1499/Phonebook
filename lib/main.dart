// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, prefer_const_constructors_in_immutables, deprecated_member_use, no_logic_in_create_state, avoid_print, prefer_is_empty, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:jor_final_project/Contact.dart';
import 'package:jor_final_project/addNewContact.dart';
import 'package:jor_final_project/listViewPhone.dart';
import 'package:jor_final_project/phonebook_title.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  static List<Contact> listModel = List<Contact>.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootLayout(),
    );
  }
}

class RootLayout extends StatelessWidget {
  final ListViewPhone listViewPhone = ListViewPhone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Center(
          child: Text('Phonebook'),
        ),
        backgroundColor: Colors.purple,
      ),

      body: Column(
          children: <Widget>[
            // TITLE PHONE BOOK
            Container(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerLeft, child: TitlePhoneBook()
                ),
              ),
            ),

            Container(
              child: Divider(
                height: 0,
                color: Colors.grey,
              ),
            ),

            // LIST PHONE BOOK
            Expanded(
              flex: 9,
              child: Container(
                child: listViewPhone,
              ),
            ),

          ],
      ),
      floatingActionButton: AddNewContact(listViewPhone.state),
    );
  }
}
