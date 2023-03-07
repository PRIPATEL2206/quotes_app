import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageApi {
  final SharedPreferences _sharedPreferences;

  LocalStorageApi(this._sharedPreferences);

// get from local storage
  List<String>? getQuotes(String key) {
    return _sharedPreferences.getStringList(key);
  }

// set to local storage
  Future<void> setQuotes(String key, List<String> quotes) async {
    await _sharedPreferences.setStringList(key, quotes);
  }
}
