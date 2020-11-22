import 'package:dio/dio.dart';
import 'package:mBet/network/api.dart';
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
            // ACCEPT: ACCEPT_JSON,
          },
        ),
      ),
    );
  }

  String get bearerToken =>
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5MjBmYTdmNy1lNTIwLTRmZjctYmY2NS1kMDEwYmU3NzkxMDMiLCJqdGkiOiIwOTI5Y2ZiZGY5MGNhYzlkMjFjOWQ1NjE2ZjllMGRiMWNjZDU5MmNiMzI0MTA2OTU5OTE2YTdiMjdlNDRkMDBiOWNkMjQzZGFkZDhjNjdjMyIsImlhdCI6MTYwNTk1OTU5NiwibmJmIjoxNjA1OTU5NTk2LCJleHAiOjE2Mzc0OTU1OTYsInN1YiI6IjEiLCJzY29wZXMiOlsidXNlciJdfQ.SVKREsZc2Mx-lEd2bSrlXAMI-O1E01G3STA8ornfGb0Vbnkab1MPK4sG7uWC2fV-i6F2DuLfzd3o_hkJ4wCxVw'
          .toBearerToken();
}
