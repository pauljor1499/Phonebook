// ignore_for_file: unused_import, unnecessary_new, prefer_const_constructors, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';
import 'package:jor_final_project/MyToastMessage.dart';
import 'package:jor_final_project/listViewPhone.dart';
import 'package:jor_final_project/main.dart';

void deleteModal(BuildContext context, int i) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        isDismissible: false,
        enableDrag: false,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text("Delete '" + Main.listModel[i].name + "'?"),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Center(
                              child: TextButton(
                                onPressed: () => Navigator.pop(context),
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(fontSize: 15),
                                ),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.green),
                                ),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                          Expanded(
                            flex: 5,
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  deleteData(i);
                                  showToasMessage('Contact Deleted.');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Main()),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(fontSize: 15),
                                ),
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  void deleteData(int i) {
    Main.listModel.removeAt(i);
  }