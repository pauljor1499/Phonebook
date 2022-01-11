// ignore_for_file: file_names, unnecessary_this

class Contact {
  late String _name = "";
  late String _occupation = "";
  late String _phone = "";
  late String _address = "";
  late String _email = "";

  String get name => _name;
  String get occupation => _occupation;
  String get phone => _phone;
  String get address => _address;
  String get email => _email;

  set name(String name) => this._name = name;
  set occupation(String occupation) => this._occupation = occupation;
  set phone(String phone) => this._phone = phone;
  set address(String address) => this._address = address;
  set email(String email) => this._email = email;
}
