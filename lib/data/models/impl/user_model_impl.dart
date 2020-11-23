import 'dart:convert';

import 'package:mBet/data/models/user_model.dart';
import 'package:mBet/persistence/daos/user_dao.dart';

class UserModelImpl extends UserModel {
  final UserDao userDao;

  UserModelImpl(this.userDao);
  @override
  Future<void> login(String username, password) async {
    try {
      var res = await api.login(username, password);
      await userDao.saveToken(res.data['token'] ?? '');
    } catch (e) {
      print(e);
      return Future.error('Username or Password is Invalid! $e');
    }
  }

  @override
  Future<void> profile() async {
    try {
      var token = await bearerToken;
      var res = await api.profile(token);
      await userDao.saveUserInfo(jsonEncode(res.data));
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> register(
      String name, String imgUrl, String username, password) async {
    await api.register(name, imgUrl, username, password);
  }
}
