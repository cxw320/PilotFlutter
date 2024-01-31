//adapter would sit inside the module with the view model and views
//adapter would surface specific methods the module needs from larger singletons (like networking, db, analytics)

import 'package:flutter/material.dart';
import 'package:pilot/Components/Main/Adapters/SecureStorage/app_root_secure_storage.dart';
import 'package:pilot/Components/Main/Features/Main/Presentation/Login/login_screen_model.dart';
import 'package:pilot/Components/Main/Features/Main/entity/event.dart';
import 'package:pilot/Components/Main/Features/Main/entity/login_error.dart';
import 'package:pilot/Components/Main/Features/Main/entity/login_info.dart';
import 'package:pilot/Components/Main/Features/Main/entity/request_response.dart';
import 'package:pilot/Components/Main/Features/Main/entity/storage_error.dart';
import 'package:pilot/Components/Main/Features/Main/entity/user_info.dart';
import 'package:pilot/Components/Main/Features/Main/usecase/log_in_usecase.dart';

class LoginScreenViewModel {
  LoginScreenViewModel(
      {required this.logInUseCase, required this.storageService});

  final ValueNotifier<LoginScreenState> state =
      ValueNotifier<LoginScreenState>(LoginScreenState.initial());
  LogInUseCase logInUseCase;
  AppRootSecureStorage storageService;

  void login(String email, String password) async {
    if (state.value.loginEvent is LoadingEvent) {
      return;
    }

    state.value = LoginScreenState.loading();

    final response = await logInUseCase.logIn(
      LoginInformation(
        email: email,
        password: password,
      ),
    );

    switch (response) {
      case SuccessRequestResponse<UserInfo, LoginError>():
        final jwtSaveSuccessful = await _saveJwt(response.data.jwtToken);

        if (jwtSaveSuccessful) {
          state.value = LoginScreenState.success(response.data);
        } else {
          state.value = LoginScreenState.error(LoginError.jwtSaveUnsuccessful);
        }
      case ErrorRequestResponse<UserInfo, LoginError>():
        state.value = LoginScreenState.error(response.error);
    }
  }

  Future<bool> _saveJwt(String token) async {
    final saveToken = await storageService.secureStorage.writeJwt(token);

    return saveToken is SuccessRequestResponse<String, StorageError>;
  }
}
