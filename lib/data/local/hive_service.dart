import 'package:hive/hive.dart';

class HiveService {
  final Box _homeBox;

  HiveService(this._homeBox);

  /// Save JSON Map
  Future<void> saveHome(Map<String, dynamic> json) async {
   
   await _homeBox.put('home_cache', json);
  }

  /// Read JSON Map
  Map<String, dynamic>? getHome() {
    final data = _homeBox.get('home_cache');
    if (data == null) return null;

    return Map<String, dynamic>.from(data);
  }

  Future<void> clearHome() async {
    await _homeBox.delete('home_cache');
  }
}
