import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mBet/blocs/app_bloc.dart';
import 'package:mBet/blocs/cart_bloc.dart';
import 'package:mBet/blocs/ticket_group_bloc.dart';
import 'package:mBet/generated/codegen_loader.g.dart';
import 'package:mBet/generated/locale_keys.g.dart';
import 'package:mBet/screens/SplashScreen.dart';
import 'package:mBet/screens/auth/LoginScreen.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      saveLocale: true,
      startLocale: Locale('my'),
      supportedLocales: [
        Locale('en'),
        Locale('my'),
      ],
      path: 'lang',
      fallbackLocale: Locale('en'),
      child: MyApp(),
      assetLoader: CodegenLoader(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppBloc()..showSplashOrHomePage(),
        ),
        ChangeNotifierProvider(
          create: (context) => TicketGroupBloc(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: LocaleKeys.title.tr(),
        theme: ThemeData(
          primaryColor: Color(PRIMARY_COLOR),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Selector<AppBloc, bool>(
          selector: (context, bloc) => bloc.isShownSplashScreen,
          builder: (context, isShownSplashScreen, child) =>
              isShownSplashScreen ? LoginScreen() : SplashScreen(),
        ),
      ),
    );
  }
}
