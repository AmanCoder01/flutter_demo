import 'package:dio/dio.dart';
import 'package:hive_new/data/models/home_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(
  baseUrl:
      "https://wpdev.vachak.com/woocommerce-reat-api/wp-json/mobikul/v1/homepage/?width=1200.0&guest_id=&customer_id=&refresh=true",
)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @GET("/")
  Future<HomeModel> getHomeData();
}
