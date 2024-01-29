import 'package:flutter/material.dart';
import 'package:pilot/Components/Main/Adapters/Network/app_root_network.dart';
import 'package:pilot/Components/Main/Features/Main/Presentation/Home/home_screen.dart';
import 'package:pilot/Components/Main/Features/Main/Presentation/Home/home_screen_model.dart';
import 'package:pilot/Components/Main/Features/Main/Presentation/Home/home_screen_view_model.dart';

abstract class AppRouter {
  Widget home();
}

class AppRouterImpl extends AppRouter {
  final AppRootNetwork network;
  
  AppRouterImpl({required this.network});

  @override
  Widget home() {
    final model = HomeScreenModel();
    final viewModel = HomeScreenViewModel(network: network, model: model);
    final view = HomeScreen(viewModel: viewModel);
    return view;
  }
}