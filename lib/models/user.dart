import 'package:flutter/material.dart';

class User {
  late final String userId;
  final String userName;

  User({this.userId = "", this.userName = ""});
  factory User.setUser(String id, name) => User(userId: id, userName: name);
}
