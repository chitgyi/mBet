import 'package:mBet/data/models/cart_model.dart';

class CartModelImpl extends CartModel {
  @override
  Future<void> checkoutTicket(int id) async {
    try {
      return await api.buyTicket(bearerToken, id);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
