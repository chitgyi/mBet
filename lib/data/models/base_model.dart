import 'package:dio/dio.dart';
import 'package:mBet/network/api.dart';
import 'package:mBet/persistence/daos/user_dao.dart';
import 'package:mBet/utils/const/api_contants.dart';
import 'package:mBet/utils/extensions/string_extension.dart';

abstract class BaseModel {
  Api api;

  BaseModel() {
    api = Api(
      Dio(
        BaseOptions(
          followRedirects: false,
          validateStatus: (statusCode) => statusCode < 400,
          headers: {
            APP_KEY: APP_KEY_VALUE,
            ACCEPT: ACCEPT_JSON,
          },
        ),
      ),
    );
  }

  Future<String> get bearerToken async {
    var token = await UserDao().getToken();
    return token.toBearerToken();
  }
}
