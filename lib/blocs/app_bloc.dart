import 'package:flutter/material.dart';

class AppBloc extends ChangeNotifier {
  bool isShownSplashScreen = false;

  int currentPageIndex = 0;

  void refreshUI() {
    notifyListeners();
  }

  void setCurrentPageIndex(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  void showSplashOrHomePage() async {
    print('_showSplashOrHomePage');
    if (!isShownSplashScreen) {
      await Future.delayed(Duration(seconds: 3));
      isShownSplashScreen = true;
      notifyListeners();
    }
  }
}
