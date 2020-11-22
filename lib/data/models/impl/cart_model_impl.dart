import 'package:dio/dio.dart';
import 'package:mBet/data/models/cart_model.dart';
import 'package:mBet/network/response/api_response.dart';

class CartModelImpl extends CartModel {
  @override
  Future<ApiResponse> checkoutTicket(int id) async {
    try {
      return await api.buyTicket(bearerToken, id);
    } on DioError catch (e) {
      if (e?.response?.statusCode == 402) {
        return Future.error(
            "ထီလက်မှတ်၀ယ်ယူခြင်းအောင်မြင်ပါသည်။ ကျန်ရှိနေသော ထီလက်များမှာ တစ်ခြားတစ်ယောက်၀ယ်ယူထားပြီးဖြစ်သောကြောင့် ၀ယ်ယူလို့ မရနိုင်ပါ။");
      }
      return Future.error(e.toString());
    }
  }
}
