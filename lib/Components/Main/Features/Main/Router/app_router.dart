import 'package:flutter/material.dart';
import 'package:pilot/Components/Authentication/authentication.dart';
import 'package:pilot/Components/Main/Adapters/Auth/app_root_auth.dart';
import 'package:pilot/Components/Main/Adapters/Network/app_root_network.dart';
import 'package:pilot/Components/Main/Adapters/SecureStorage/app_root_secure_storage.dart';
import 'package:pilot/Components/Main/Features/Main/Presentation/Home/home_screen.dart';
import 'package:pilot/Components/Main/Features/Main/Presentation/Home/home_screen_model.dart';
import 'package:pilot/Components/Main/Features/Main/Presentation/Home/home_screen_view_model.dart';
import 'package:pilot/Components/Main/Features/Main/Presentation/Login/login_screen.dart';
import 'package:pilot/Components/Main/Features/Main/Presentation/Login/login_screen_view_model.dart';
import 'package:pilot/Components/Main/Features/Main/usecase/log_in_usecase_impl.dart';
import 'package:pilot/Components/SecureStorage/secure_storage.dart';

abstract class AppRouter {
  Widget home();
  Widget login();
}

class AppRouterImpl extends AppRouter {
  final AppRootNetwork network;
  final AppRootSecureStorage storageService;
  final AppRootAuth auth;

  AppRouterImpl(
      {required this.network,
      required this.auth,
      required this.storageService});

  @override
  Widget login() {
    final loginUseCase = LogInUseCaseImpl(auth: auth);
    final viewModel = LoginScreenViewModel(
        logInUseCase: loginUseCase, storageService: storageService);
    final view = LoginScreen(viewModel: viewModel);
    return view;
  }

  @override
  Widget home() {
    final model = HomeScreenModel();
    final viewModel = HomeScreenViewModel(network: network, model: model);
    final view = HomeScreen(viewModel: viewModel);
    return view;
  }
}
