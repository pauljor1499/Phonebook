// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, file_names, unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Textfield Name
class TextFieldName extends StatefulWidget {
  @override
  TextFieldNameState createState() => TextFieldNameState();
}

class TextFieldNameState extends State<TextFieldName> {
  static TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      onChanged: (value){
        setState(() {});
      },
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        hintText: "Name",
        hintStyle: TextStyle(
          color: Colors.black26,
          fontSize: 15,
        ),
        contentPadding: EdgeInsets.fromLTRB(0, 25, 0, 0),
        suffixIcon: nameController.text.isEmpty
          ? null
          : IconButton(
            iconSize: 15,
            color: Colors.red,
            onPressed: nameController.clear,
            icon: Icon(Icons.clear),
          ),
        errorText: validateInput(nameController.text),
      ),
    );
  }
}



//Textfield Occupation
class TextFieldOccupation extends StatefulWidget {
  @override
  TextFieldOccupationState createState() => TextFieldOccupationState();
}

class TextFieldOccupationState extends State<TextFieldOccupation> {
  static TextEditingController occupationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: occupationController,
      onChanged: (value){
        setState(() {});
      },
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        hintText: "Occupation",
        hintStyle: TextStyle(
          color: Colors.black26,
          fontSize: 15,
        ),
        contentPadding: EdgeInsets.fromLTRB(0, 25, 0, 0),
        suffixIcon: occupationController.text.isEmpty
          ? null
          : IconButton(
            iconSize: 15,
            color: Colors.red,
            onPressed: occupationController.clear,
            icon: Icon(Icons.clear),
          ),
      ),
    );
  }
}

//Textfield Phone
class TextFieldPhone extends StatefulWidget {
  @override
  TextFieldPhoneState createState() => TextFieldPhoneState();
}

class TextFieldPhoneState extends State<TextFieldPhone> {
  static TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneController,
      onChanged: (value){
        setState(() {});
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Phone Number",
        hintStyle: TextStyle(
          color: Colors.black26,
          fontSize: 15,
        ),
        contentPadding: EdgeInsets.fromLTRB(0, 25, 0, 0),
        suffixIcon: phoneController.text.isEmpty
          ? null
          : IconButton(
            iconSize: 15,
            color: Colors.red,
            onPressed: phoneController.clear,
            icon: Icon(Icons.clear),
          ),
        errorText: validateInput(phoneController.text),
      ),
    );
  }
}

//Textfield Address
class TextFieldAddress extends StatefulWidget {
  @override
  TextFieldAddressState createState() => TextFieldAddressState();
}

class TextFieldAddressState extends State<TextFieldAddress> {
  static TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: addressController,
      onChanged: (value){
        setState(() {});
      },
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        hintText: "Address",
        hintStyle: TextStyle(
          color: Colors.black26,
          fontSize: 15,
        ),
        contentPadding: EdgeInsets.fromLTRB(0, 25, 0, 0),
        suffixIcon: addressController.text.isEmpty
          ? null
          : IconButton(
            iconSize: 15,
            color: Colors.red,
            onPressed: addressController.clear,
            icon: Icon(Icons.clear),
          ),
      ),
    );
  }
}

//Textfield Email
class TextFieldEmail extends StatefulWidget {
  @override
  TextFieldEmailState createState() => TextFieldEmailState();
}

class TextFieldEmailState extends State<TextFieldEmail> {
  static TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      onChanged: (value){
        setState(() {});
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "sample@gmail.com",
        hintStyle: TextStyle(
          color: Colors.black26,
          fontSize: 15,
        ),
        contentPadding: EdgeInsets.fromLTRB(0, 25, 0, 0),
        suffixIcon: emailController.text.isEmpty
          ? null
          : IconButton(
            iconSize: 15,
            color: Colors.red,
            onPressed: emailController.clear,
            icon: Icon(Icons.clear),
          ),
      ),
    );
  }
}

String? validateInput(String value) {
  if (value.isEmpty) {
    return "This field is required.";
  }
  return null;
}
