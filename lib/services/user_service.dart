import 'package:dio/dio.dart';

import '../models/result_status.dart';
import '../helper/api_routes.dart';

class UserService {
  Future<ResultStatus> authenticateWithEmail(
      {required String email, required String password}) async {
    Dio dio = Dio();
    var options = Options(
      headers: {"Content-Type": "application/json"},
    );
    var body = {"email": email, "password": password};
    Response response =
        await dio.post(ADMIN_LOGIN_EMAIL, options: options, data: body);
    print(response);
    return ResultStatus(
        status: false,
        statusCode: response.statusCode!.toInt(),
        message: 'Login Failed.');
  }
}
