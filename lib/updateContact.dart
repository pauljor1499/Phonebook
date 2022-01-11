// ignore_for_file: unused_import, unnecessary_new, prefer_const_constructors, file_names, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:jor_final_project/Contact.dart';
import 'package:jor_final_project/MyTextFields.dart';
import 'package:jor_final_project/MyToastMessage.dart';
import 'package:jor_final_project/contactDetails.dart';
import 'package:jor_final_project/listViewPhone.dart';
import 'package:jor_final_project/main.dart';

void updateModal(BuildContext context, int i) {
  TextEditingController updateName_Controller =
      TextEditingController(text: Main.listModel[i].name);
  TextEditingController updateOccupation_Controller =
      TextEditingController(text: Main.listModel[i].occupation);
  TextEditingController updatePhone_Controller =
      TextEditingController(text: Main.listModel[i].phone);
  TextEditingController updateAddress_Controller =
      TextEditingController(text: Main.listModel[i].address);
  TextEditingController updateEmail_Controller =
      TextEditingController(text: Main.listModel[i].email);

  TextFieldNameState.nameController.text = updateName_Controller.text;
  TextFieldOccupationState.occupationController.text =
      updateOccupation_Controller.text;
  TextFieldPhoneState.phoneController.text = updatePhone_Controller.text;
  TextFieldAddressState.addressController.text = updateAddress_Controller.text;
  TextFieldEmailState.emailController.text = updateEmail_Controller.text;

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
                title: Center(
                  child: Text('Update Contact',
                      style: TextStyle(fontWeight: FontWeight.bold)),
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
                dense: true,
              ),

              ListTile(
                leading: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Icon(Icons.work),
                ),
                title: Container(
                  child: TextFieldOccupation(),
                ),
                dense: true,
              ),

              ListTile(
                leading: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Icon(Icons.phone),
                ),
                title: Container(
                  child: TextFieldPhone(),
                ),
                dense: true,
              ),

              ListTile(
                leading: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Icon(Icons.location_city),
                ),
                title: Container(
                  child: TextFieldAddress(),
                ),
                dense: true,
              ),

              ListTile(
                leading: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Icon(Icons.email),
                ),
                title: Container(
                  child: TextFieldEmail(),
                ),
                dense: true,
              ),

              SizedBox(
                height: 10.0,
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
                                onButtonUpdate(
                                  context,
                                  i,
                                  TextFieldNameState.nameController.text,
                                  TextFieldOccupationState
                                      .occupationController.text,
                                  TextFieldPhoneState.phoneController.text,
                                  TextFieldAddressState.addressController.text,
                                  TextFieldEmailState.emailController.text,
                                );
                              },
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(fontSize: 15),
                              ),
                              child: const Text(
                                'Update',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

void onButtonUpdate(
  BuildContext context,
  int i,
  String update_name,
  String update_occupation,
  String update_phone,
  String update_address,
  String update_email,
) {
  if (update_name == "" || update_phone == "") {
    showToasMessage('Please fill up name and phone fields.');
  } else {
    bool isValid = true;

    for (var element in Main.listModel) {
      if (element.name == update_name &&
          element.occupation == update_occupation &&
          element.phone == update_phone &&
          element.address == update_address &&
          element.email == update_email) {
        isValid = false;
        break;
      }
    }

    if (isValid) {
      Contact update_model = Contact();
      update_model.name = update_name;
      update_model.occupation = update_occupation;
      update_model.phone = update_phone;
      update_model.address = update_address;
      update_model.email = update_email;

      for (var element in Main.listModel) {
        if (element == Main.listModel[i]) {
          Main.listModel.removeAt(i);
          Main.listModel.insert(i, update_model);
        }
      }

      // state.updateState();
      showToasMessage('Contact updated.');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ContactDetails(i)),
          (Route<dynamic> route) => route.isFirst);

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
