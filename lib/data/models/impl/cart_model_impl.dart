import 'package:dio/dio.dart';
import 'package:mBet/data/models/cart_model.dart';
import 'package:mBet/network/response/api_response.dart';
import 'package:mBet/network/response/order_response.dart';

class CartModelImpl extends CartModel {
  @override
  Future<OrderResponse> checkoutTicket(Map<String, dynamic> data) async {
    try {
      var token = await bearerToken;
      return await api.buyTicket(token, data);
    } on DioError catch (e) {
      if (e?.response?.statusCode == 402) {
        return OrderResponse.fromJson(e.response.data);
      }
      return Future.error(e.toString());
    }
  }
}
