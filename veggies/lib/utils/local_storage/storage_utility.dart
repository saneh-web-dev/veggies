import 'package:get_storage/get_storage.dart';

class VLocalStorage {
  static final VLocalStorage _instance = VLocalStorage._internal();
  VLocalStorage._internal();

  factory VLocalStorage() {
    return _instance;
  }

  final _storage = GetStorage();

  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  //generic method to read data
  T? readData<T>(String key) {
    var value = _storage.read<T>(key);
    return value;
  }

  //generic method to delete data
  Future<void> deleteData(String key) async {
    await _storage.remove(key);
  }

  //generic method to clear data
  Future<void> clearData() async {
    await _storage.erase();
  }
}
