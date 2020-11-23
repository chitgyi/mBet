import 'dart:convert';

import 'package:mBet/data/vos/user_vo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDao {
  static final UserDao _dao = UserDao._();

  UserDao._();

  factory UserDao() => _dao;

  Future<void> saveUserInfo(String string) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('user_info', string);
  }

  Future<UserVO> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userInfoString = prefs.getString('user_info') ?? null;
    if (userInfoString == null) return null;
    return UserVO.fromJson(jsonDecode(userInfoString));
  }

  Future<void> saveToken(String string) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('token', string);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? null;
    return token;
  }
}
