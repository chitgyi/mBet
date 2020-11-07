import 'package:flutter/cupertino.dart';

class AppBloc extends ChangeNotifier {
  bool isShownSplashScreen = false;

  void showSplashOrHomePage() async {
    print('_showSplashOrHomePage');
    if (!isShownSplashScreen) {
      await Future.delayed(Duration(seconds: 3));
      isShownSplashScreen = true;
      notifyListeners();
    }
  }
}
