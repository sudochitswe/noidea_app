import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/user.dart';
import 'package:pocketbase/pocketbase.dart';

import '../helper/api_routes.dart';
import '../models/result_status.dart';

class UserVM extends ChangeNotifier {
  ResultStatus _result = ResultStatus(status: true);
  ResultStatus get statusInfo => _result;
  User _user = User();
  bool get isAuth {
    return _adminAuthModel.token != "";
  }

  AdminAuth _adminAuthModel = AdminAuth();
  User get myUser {
    return _user;
  }

  void simulateLogin(String id, name) {
    User simulateUser = User.setUser(id, name);
    _user = simulateUser;
    notifyListeners();
  }

  Future<ResultStatus> pocketBaseAdminEmailLogin(
      String email, String password) async {
    try {
      AdminService pocketBaseAdminSvc = AdminService(MAIN_POCKET_BASE);
      _adminAuthModel = await pocketBaseAdminSvc.client.admins.authViaEmail(
        email,
        password,
      );
      _result.status = true;
      _result.message = "";
      notifyListeners();
    } on ClientException catch (e) {
      print(e.response["message"]);
      _result.status = false;
      _result.message = e.response["message"];
    }
    return statusInfo;
  }

  void simulateLogout() {
    // _user = User();
    _adminAuthModel = AdminAuth();
    notifyListeners();
  }

  Future<void> auth_login(String id, name) async {
    User authUser = User.setUser(id, name);
    _user = authUser;
    notifyListeners();
  }
}
