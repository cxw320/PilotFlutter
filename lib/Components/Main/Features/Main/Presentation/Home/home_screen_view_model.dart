import 'package:pilot/Components/Authentication/authentication.dart';
import 'package:pilot/Components/Main/Adapters/Network/app_root_network.dart';
import 'package:pilot/Components/Main/Features/Main/Presentation/Home/home_screen_model.dart';

class HomeScreenViewModel {
  const HomeScreenViewModel({required this.network, required this.model});
  final HomeScreenModel model;
  final AppRootNetwork network;
  
}