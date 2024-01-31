import 'package:pilot/Components/Authentication/authentication.dart';
import 'package:pilot/Components/Network/network.dart';
import 'package:pilot/Components/SecureStorage/secure_storage.dart';

abstract class AppRootDependencyProvider {
  NetworkProtocol network();
  AuthProtocol auth();
  StorageServiceProtocol secureStorage();
}
