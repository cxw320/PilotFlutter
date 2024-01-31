import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pilot/Components/Main/Features/Main/entity/request_response.dart';
import 'package:pilot/Components/Main/Features/Main/entity/storage_error.dart';
import 'package:pilot/Components/SecureStorage/DependencyProvider/secure_storage_dependency_provider_interface.dart';

abstract class StorageServiceProtocol {
  Future<RequestResponse<String, StorageError>> writeJwt(String token);

  Future<RequestResponse<String?, StorageError>> readJwt();

  Future<RequestResponse<String, StorageError>> deleteJwt();
}

class StorageService extends StorageServiceProtocol {
  final FlutterSecureStorage _secureStorage;
  final String _jwtTokenKey = 'jwt_token';

  // StorageService({required FlutterSecureStorage secureStorage}) : _secureStorage = secureStorage;

  StorageService._(this._secureStorage);
  factory StorageService(
      {SecureStorageDependencyProvider? dependencyProvider}) {
    final secureStorage =
        dependencyProvider?.secureStorage() ?? const FlutterSecureStorage();
    return StorageService._(secureStorage);
  }
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @override
  Future<RequestResponse<String, StorageError>> readJwt() async {
    try {
      final data = await _secureStorage.read(
          key: _jwtTokenKey, aOptions: _getAndroidOptions());
      if (data != null) {
        return SuccessRequestResponse(data);
      } else {
        return const ErrorRequestResponse(StorageError.readError);
      }
    } on Exception catch (_) {
      return const ErrorRequestResponse(StorageError.readError);
    }
  }

  @override
  Future<RequestResponse<String, StorageError>> deleteJwt() async {
    try {
      await _secureStorage.delete(
          key: _jwtTokenKey, aOptions: _getAndroidOptions());
      return const SuccessRequestResponse('Successfully deleted JWT');
    } on Exception catch (_) {
      return const ErrorRequestResponse(StorageError.deleteError);
    }
  }

  @override
  Future<RequestResponse<String, StorageError>> writeJwt(String token) async {
    try {
      await _secureStorage.write(
          key: _jwtTokenKey, value: token, aOptions: _getAndroidOptions());
      return const SuccessRequestResponse('Successfully saved JWT');
    } on Exception catch (_) {
      return const ErrorRequestResponse(StorageError.writeError);
    }
  }
}
