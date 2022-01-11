// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, prefer_const_constructors_in_immutables, deprecated_member_use, no_logic_in_create_state, avoid_print, prefer_is_empty, unnecessary_new, unused_local_variable, file_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jor_final_project/contactDetails.dart';
import 'package:jor_final_project/main.dart';

class ListViewPhone extends StatefulWidget {
  final ListViewPhoneState state = ListViewPhoneState();
  @override
  ListViewPhoneState createState() => state;
}

class ListViewPhoneState extends State<ListViewPhone> {
  updateState() {
    if (mounted) {
      print('Mounted');
      setState(() {});
    } else {
      print('Not Mounted');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Main.listModel.length == 0) {
      return NoData();
    }
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      separatorBuilder: (context, i) => Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Divider(
          height: 0,
          color: Colors.grey,
        ),
      ),
      itemCount: Main.listModel.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                //row 1
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 15,
                    child: Image.asset(
                      'assets/images/default_image.png',
                      height: 20,
                      width: 20,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                //row 2
                Expanded(
                  flex: 8,
                  child: Text(
                    Main.listModel[i].name,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactDetails(i),
              ),
            );
          },
        );
      },
    );
  }

  void deleteData(int i) {
    Main.listModel.removeAt(i);
  }
}

class NoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("No Data"),
    );
  }
}
