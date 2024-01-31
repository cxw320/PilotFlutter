import 'package:pilot/Components/Authentication/authentication.dart';
import 'package:pilot/Components/Main/Adapters/Auth/app_root_auth.dart';
import 'package:pilot/Components/Main/Adapters/Network/app_root_network.dart';
import 'package:pilot/Components/Main/Adapters/SecureStorage/app_root_secure_storage.dart';
import 'package:pilot/Components/Main/DependencyProvider/app_root_dependency_provider_interface.dart';
import 'package:pilot/Components/Main/Features/Main/Router/app_router.dart';
import 'package:pilot/Components/Network/network.dart';
import 'package:pilot/Components/SecureStorage/secure_storage.dart';

class AppRoot {
  final AppRouter _router;

  AppRoot._(this._router);

  factory AppRoot({AppRootDependencyProvider? dependencyProvider}) {
    final network = dependencyProvider?.network() ?? Network();
    final auth = dependencyProvider?.auth() ?? Auth();
    final secureStorage =
        dependencyProvider?.secureStorage() ?? StorageService();

    final appRootNetwork = AppRootNetwork(network: network);
    final appRootSecureStorage =
        AppRootSecureStorage(secureStorage: secureStorage);
    final appRootAuth = AppRootAuth(auth: auth);
    final router = AppRouterImpl(
        network: appRootNetwork,
        storageService: appRootSecureStorage,
        auth: appRootAuth);

    return AppRoot._(router);
  }

  AppRouter router() {
    return _router;
  }
}
