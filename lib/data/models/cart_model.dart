import 'package:mBet/data/models/base_model.dart';

abstract class CartModel extends BaseModel {
  Future<void> checkoutTicket(int id);
}