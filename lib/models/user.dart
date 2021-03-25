import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email, name, firstname, city;
  User({this.email, this.name, this.firstname, this.city});

  fromJson(json) {
    return User(
      email: json['email'],
      name: json['name'],
      firstname: json['firstname'],
      city: json['city'],
    );
  }
}

class ItemArguments {
  final String text;
  final String title;

  ItemArguments({this.text, this.title});
}
