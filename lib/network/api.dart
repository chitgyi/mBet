import 'package:mBet/network/response/api_response.dart';
import 'package:mBet/network/response/order_response.dart';
import 'package:mBet/utils/const/api_contants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET('{path}')
  Future<ApiResponse> tickets(
    @Header(AUTHORIZATION) String token,
    @Path() String path,
  );

  @POST(LOGIN_ENTRY)
  Future<ApiResponse> login(
    @Field() String username,
    @Field() String password,
  );

  @POST(REGISTER_ENTRY)
  Future<ApiResponse> register(
    @Field() String name,
    @Field(IMG_URL_KEY) String imgUrl,
    @Field() String username,
    @Field() String password,
  );

  @GET(PROFILE_ENTRY)
  Future<ApiResponse> profile(
    @Header(AUTHORIZATION) String token,
  );

  @POST(BUY_TICKETS_ENTRY)
  Future<OrderResponse> buyTicket(
    @Header(AUTHORIZATION) String token,
    @Body() Map<String, dynamic> data,
  );
}
