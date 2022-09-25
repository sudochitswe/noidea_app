import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/user.dart';

class UserVM extends ChangeNotifier {
  User _user = User();
  bool get isAuth {
    return _user.userId != "";
  }

  User get myUser {
    return _user;
  }

  void simulateLogin(String id, name) {
    User simulateUser = User.setUser(id, name);
    _user = simulateUser;
    notifyListeners();
  }

  void simulateLogout() {
    _user = User();
    notifyListeners();
  }

  Future<void> auth_login(String id, name) async {
    User authUser = User.setUser(id, name);
    _user = authUser;
    notifyListeners();
  }
}
