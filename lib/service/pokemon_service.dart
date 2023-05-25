import 'package:dio/dio.dart';
import 'package:pokemon_service/core/config/dio_catch_config.dart';
import 'package:pokemon_service/core/config/dio_config.dart';
import 'package:pokemon_service/core/constant/project_url.dart';

class UsersService {
  static Future<dynamic> getUser() async {
    try {
      Response response = await DioConfig.createRequest().get(ProjectUrl.users);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return DioCatchConfig.catchError(e);
    }
  }
}
