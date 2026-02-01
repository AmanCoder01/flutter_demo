import '../models/home_model.dart';
import '../network/api_service.dart';
import '../local/hive_service.dart';

class HomeRepository {
  final ApiService apiService;
  final HiveService hiveService;

  HomeRepository({required this.apiService, required this.hiveService});

  Future<HomeModel> getHome() async {
    try {
      final response = await apiService.getHomeData();

      // save cache
      await hiveService.saveHome(response.toJson());

      return response;
    } catch (e) {
      // 🔥 OFFLINE / ERROR fallback
      final cached = hiveService.getHome();
      print('CACHE TYPE: ${cached.runtimeType}');
      print('CACHE VALUE: $cached');

      if (cached != null) {
        final res = HomeModel.fromJson(cached);
        return res;
      }

      // no cache exists
      throw Exception('No internet & no cached data');
    }
  }

  HomeModel? getCachedHome() {
    final cached = hiveService.getHome();
    if (cached == null) return null;

    return HomeModel.fromJson(cached);
  }

  Future<void> clearCache() => hiveService.clearHome();
}
