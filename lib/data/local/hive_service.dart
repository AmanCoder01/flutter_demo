import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_new/data/local/hive_keys.dart';
import 'package:hive_new/data/models/home_model.dart';

class HiveService {

  static late Box _homeBox;

  /// 🔥 Call this ONCE at app start
  static Future<void> init() async {
    await Hive.initFlutter();

    // ✅ Register adapters (ONLY ONCE)
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(HomeModelAdapter());
      Hive.registerAdapter(BannerModelAdapter());
      Hive.registerAdapter(CategoryAdapter());
      Hive.registerAdapter(HomepageProductAdapter());
      Hive.registerAdapter(ProductAdapter());
      Hive.registerAdapter(SettingsAdapter());
      Hive.registerAdapter(ThemeSettingsAdapter());
      Hive.registerAdapter(AppThemeAdapter());
    }

    _homeBox = await Hive.openBox(HiveBoxes.home);
  }

  /// Save JSON Map
  Future<void> saveHome(HomeModel data) async {
    await _homeBox.put(HiveKeys.homeCache, data);
  }

  /// Read JSON Map
  Map<String, dynamic>? getHome() {
    final data = _homeBox.get('home_cache');
    if (data == null) return null;

    // 🔥 critical cast fix
    return Map<String, dynamic>.from(data);
  }

  Future<void> clearHome() async {
    await _homeBox.delete('home_cache');
  }
}
