import 'package:pilot/Components/Authentication/authentication.dart';
import 'package:pilot/Components/Main/Adapters/Auth/app_root_auth.dart';
import 'package:pilot/Components/Main/Features/Main/entity/login_error.dart';
import 'package:pilot/Components/Main/Features/Main/entity/login_info.dart';
import 'package:pilot/Components/Main/Features/Main/entity/request_response.dart';
import 'package:pilot/Components/Main/Features/Main/entity/user_info.dart';
import 'package:pilot/Components/Main/Features/Main/usecase/log_in_usecase.dart';

class LogInUseCaseImpl extends LogInUseCase {
  LogInUseCaseImpl({
    required AppRootAuth auth,
  }) : _auth = auth;

  final AppRootAuth _auth;

  @override
  Future<RequestResponse<UserInfo, LoginError>> logIn(
      LoginInformation loginInformation) {
    final email = loginInformation.email;
    final password = loginInformation.password;
    if (email.isEmpty) {
      return Future.value(const ErrorRequestResponse(LoginError.emptyEmail));
    } else if (password.isEmpty) {
      return Future.value(const ErrorRequestResponse(LoginError.emptyPassword));
    }
    return _auth.auth.logIn(loginInformation);
  }
}