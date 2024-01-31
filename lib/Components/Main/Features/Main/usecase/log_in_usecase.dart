import 'package:pilot/Components/Main/Features/Main/entity/login_error.dart';
import 'package:pilot/Components/Main/Features/Main/entity/login_info.dart';
import 'package:pilot/Components/Main/Features/Main/entity/request_response.dart';
import 'package:pilot/Components/Main/Features/Main/entity/user_info.dart';

abstract class LogInUseCase {
  Future<RequestResponse<UserInfo, LoginError>> logIn(
      LoginInformation loginInformation);
}
