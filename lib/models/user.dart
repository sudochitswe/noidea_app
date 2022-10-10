import 'package:flutter/material.dart';

class User {
  late final String userId;
  final String userName;
  final String img;

  User({this.userId = "", this.userName = "", this.img = ""});
  factory User.setUser(String id, name) => User(userId: id, userName: name);
}
