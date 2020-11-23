import 'package:mBet/data/models/user_model.dart';

class UserModelImpl extends UserModel {
  @override
  Future<void> login(String username, password) async {
    await api.login(username, password);
  }

  @override
  Future<void> profile() async {
    await api.profile(bearerToken);
  }

  @override
  Future<void> register(
      String name, String imgUrl, String username, password) async {
    await api.register(name, imgUrl, username, password);
  }
}
