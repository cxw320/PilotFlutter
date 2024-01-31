import 'package:pilot/Components/Main/Features/Main/entity/login_error.dart';
import 'package:pilot/Components/Main/Features/Main/entity/login_info.dart';
import 'package:pilot/Components/Main/Features/Main/entity/request_response.dart';
import 'package:pilot/Components/Main/Features/Main/entity/user_info.dart';

abstract class AuthProtocol {
  Future<RequestResponse<UserInfo, LoginError>> logIn(
      LoginInformation loginInformation);
}

class Auth extends AuthProtocol {
  @override
  Future<RequestResponse<UserInfo, LoginError>> logIn(
    LoginInformation loginInformation,
  ) async {
    await Future.delayed(const Duration(seconds: 2));

    final email = loginInformation.email;
    final password = loginInformation.password;
    if (email == 'admin@testing.com' && password == 'admin') {
      return Future.value(SuccessRequestResponse(UserInfo(
        name: 'Admin',
        email: email,
        jwtToken: 'example_token',
      )));
    } else {
      return Future.value(
          const ErrorRequestResponse(LoginError.incorrectEmailOrPassword));
    }
  }
}