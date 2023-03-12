import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:travel_app/models/storage_item.model.dart';

class StorageService {
  final _securedStorage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  Future<void> write(StorageItem newItem) async {
    await _securedStorage.write(
      key: newItem.key,
      value: newItem.value,
      aOptions: _getAndroidOptions(),
    );
  }

  Future<String?> getValueByKey(String key) async {
    return await _securedStorage.read(key: key, aOptions: _getAndroidOptions());
  }

  Future<void> deleteItem(StorageItem item) async {
    await _securedStorage.delete(key: item.key, aOptions: _getAndroidOptions());
  }

  Future<bool> hasKey(String key) async {
    return await _securedStorage.containsKey(
      key: key,
      aOptions: _getAndroidOptions(),
    );
  }
}
