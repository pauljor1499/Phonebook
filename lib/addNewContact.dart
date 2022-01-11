// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, prefer_const_constructors_in_immutables, deprecated_member_use, no_logic_in_create_state, avoid_print, prefer_is_empty, unnecessary_new, file_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jor_final_project/Contact.dart';
import 'package:jor_final_project/MyTextFields.dart';
import 'package:jor_final_project/MyToastMessage.dart';
import 'package:jor_final_project/listViewPhone.dart';
import 'package:jor_final_project/main.dart';

class AddNewContact extends StatelessWidget {
  final ListViewPhoneState state;
  AddNewContact(this.state);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => BottomModalAdd(context),
      backgroundColor: Colors.purple,
      child: const Icon(Icons.add),
    );
  }

  void onButtonSaveClick(
    BuildContext context,
    String name,
    String occupation,
    String phone,
    String address,
    String email,
  ) {
    if (name == "" || phone == "") {
      showToasMessage('Please fill up name and phone fields.');
    } else {
      bool isValid = true;

      for (var element in Main.listModel) {
        if (element.name == name && element.phone == phone) {
          isValid = false;
          break;
        }
      }

      if (isValid) {
        Contact model = Contact();
        model.name = name;
        model.occupation = occupation;
        model.phone = phone;
        model.address = address;
        model.email = email;
        Main.listModel.add(model);
        state.updateState();

        Navigator.pop(context);
        showToasMessage('New contact added.');

        TextFieldNameState.nameController.clear();
        TextFieldOccupationState.occupationController.clear();
        TextFieldPhoneState.phoneController.clear();
        TextFieldAddressState.addressController.clear();
        TextFieldEmailState.emailController.clear();
      } else {
        showToasMessage('Contact already exists.');
      }
    }
  }

  void BottomModalAdd(BuildContext context) {
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
                //Modal Header
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.black,
                    onPressed: () => CloseModal(context),
                  ),
                  title: Center(
                    child: Text('New Contact',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.check),
                    color: Colors.black,
                    onPressed: () => onButtonSaveClick(
                        context,
                        TextFieldNameState.nameController.text,
                        TextFieldOccupationState.occupationController.text,
                        TextFieldPhoneState.phoneController.text,
                        TextFieldAddressState.addressController.text,
                        TextFieldEmailState.emailController.text),
                  ),
                ),

                Divider(
                  thickness: 1,
                ),

                //Modal Textfields
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Icon(Icons.person),
                  ),
                  title: Container(
                    child: TextFieldName(),
                  ),
                  dense:true,
                ),

                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Icon(Icons.phone),
                  ),
                  title: Container(
                    child: TextFieldPhone(),
                  ),
                  dense:true,
                ),

                //Modal Footer
                ListTile(
                  leading: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      BottomModalAddMoreInfo(context);
                    },
                    child: const Text(
                      'Add more info',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue),
                    ),
                  ),
                  dense:true,
                ),
                
              ],
            ),
          );
        });
  }

  void BottomModalAddMoreInfo(BuildContext context) {
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
                //Modal Header
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.black,
                    onPressed: () => CloseModal(context),
                  ),
                  title: Center(
                    child: Text('New Contact',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.check),
                    color: Colors.black,
                    onPressed: () => onButtonSaveClick(
                        context,
                        TextFieldNameState.nameController.text,
                        TextFieldOccupationState.occupationController.text,
                        TextFieldPhoneState.phoneController.text,
                        TextFieldAddressState.addressController.text,
                        TextFieldEmailState.emailController.text),
                  ),
                ),

                Divider(
                  thickness: 1,
                ),

                //Modal Textfields
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Icon(Icons.person),
                  ),
                  title: Container(
                    child: TextFieldName(),
                  ),
                  dense:true,
                ),

                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Icon(Icons.work),
                  ),
                  title: Container(
                    child: TextFieldOccupation(),
                  ),
                  dense:true,
                ),

                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Icon(Icons.phone),
                  ),
                  title: Container(
                    child: TextFieldPhone(),
                  ),
                  dense:true,
                ),

                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Icon(Icons.location_city),
                  ),
                  title: Container(
                    child: TextFieldAddress(),
                  ),
                  dense:true,
                ),
                
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Icon(Icons.email),
                  ),
                  title: Container(
                    child: TextFieldEmail(),
                  ),
                  dense:true,
                ),

                //Modal Footer
                ListTile(
                  leading: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      CloseModalMoreInfo(context);
                      BottomModalAdd(context);
                    },
                    child: const Text(
                      'Add less info',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue),
                    ),
                  ),
                  dense:true,
                ),

              ],
            ),
          );
        });
  }

  void CloseModal(BuildContext context) {
    TextFieldPhoneState.phoneController.clear();
    TextFieldOccupationState.occupationController.clear();
    TextFieldNameState.nameController.clear();
    TextFieldAddressState.addressController.clear();
    TextFieldEmailState.emailController.clear();
    Navigator.pop(context);
  }

  void CloseModalMoreInfo(BuildContext context) {
    TextFieldOccupationState.occupationController.clear();
    TextFieldAddressState.addressController.clear();
    TextFieldEmailState.emailController.clear();
    Navigator.pop(context);
  }
}
