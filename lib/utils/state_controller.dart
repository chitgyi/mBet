import 'package:flutter/cupertino.dart';
import 'package:mBet/utils/view_state.dart';

abstract class StateController with ChangeNotifier {
  ViewState viewState;
  String errorMsg;

  StateController() {
    viewState = ViewState.Loading;
  }

  void setState(ViewState state) {
    this.viewState = state;
    notifyListeners();
  }

  void refreshUI() {
    notifyListeners();
  }

  void setError(String message) {
    this.errorMsg = message;
    this.viewState = ViewState.Error;
    notifyListeners();
  }
}
