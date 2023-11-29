// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  
  final storage = const FlutterSecureStorage();


  /// Store a string [value] to secure storage with the given [key]
  Future<void> storeStringValue({ required String key, required String value }) async {
    await storage.write(
      key: key,
      value: value,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  /// Store a int [value] to secure storage with the given [key]
  Future<void> storeIntValue({ required String key, required int value }) async {
    await storage.write(
      key: key,
      value: value.toString(),
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  /// Get a string value from secure storage with the given [key]
  /// returns null if the value does not exist for the given key
  /// 
  Future<String?> getStringValue({ required String key }) async {
    return await storage.read(
      key: key,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }


  /// Get a int value from secure storage with the given [key]
  Future<int?> getIntValue({ required String key }) async {
    String? value = await storage.read(
      key: key,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );

    return value != null ? int.parse(value) : null;
  }

  /// Deletes a specific value from storage with the given [key]
  Future<void> deleteValue({ required String key }) async {
    await storage.delete(
      key: key,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  IOSOptions _getIOSOptions() => const IOSOptions();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );


}