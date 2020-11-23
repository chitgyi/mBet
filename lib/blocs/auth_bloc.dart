import 'package:mBet/data/models/impl/user_model_impl.dart';
import 'package:mBet/data/models/user_model.dart';
import 'package:mBet/persistence/daos/user_dao.dart';

class AuthBloc {
  UserModel _userModel;
  String errorMsg = '';

  AuthBloc() {
    _userModel = UserModelImpl(UserDao());
  }

  Future<void> login(String username, String password) async {
    try {
      if (_isValideLoginForm(username, password)) {
        await _userModel.login(username, password);
      } else {
        return Future.error(errorMsg);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  bool _isValideLoginForm(String username, String password) {
    if (username.isEmpty) {
      errorMsg = "Username is empty";
      return false;
    } else if (password.isEmpty) {
      errorMsg = "Password is empty";
      return false;
    } else {
      return true;
    }
  }
}
