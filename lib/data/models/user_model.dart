import 'package:mBet/data/models/base_model.dart';

abstract class UserModel extends BaseModel {
  Future<void> profile();
  Future<void> login(String username, password);
  Future<void> register(String name, String imgUrl, String username, password);
}
