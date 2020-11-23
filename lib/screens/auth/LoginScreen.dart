import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mBet/blocs/auth_bloc.dart';
import 'package:mBet/generated/locale_keys.g.dart';
import 'package:mBet/screens/App.dart';
import 'package:mBet/screens/auth/RegisterSreen.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/utils/const/font_size.dart';
import 'package:mBet/utils/const/illustrations.dart';
import 'package:mBet/utils/pure_function.dart';
import 'package:mBet/utils/router.dart';
import 'package:mBet/widgets/items/auth_text_field.dart';
import 'package:mBet/widgets/items/half_button.dart';
import 'package:mBet/widgets/views/background_wrapper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: BackgroundWrapper(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: LARGE_DIM_3X + MediaQuery.of(context).padding.top,
                  ),
                  Image.asset(
                    Illustrations.login,
                    fit: BoxFit.contain,
                    width: AUTH_IMG_SIZE,
                    height: AUTH_IMG_SIZE,
                  ),
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: NORMAL_DIM_3X),
                      child: Text(
                        LocaleKeys.please_login.tr(),
                        style: GoogleFonts.gabriela(
                          fontSize: TEXT_LARGE,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  AuthTextField(
                    controller: _username,
                    hintText: LocaleKeys.username.tr(),
                    iconData: Icons.person,
                  ),
                  SizedBox(
                    height: NORMAL_DIM_2X,
                  ),
                  AuthTextField(
                    controller: _password,
                    hintText: LocaleKeys.password.tr(),
                    isSecure: true,
                    iconData: Icons.lock,
                  ),
                  SizedBox(
                    height: NORMAL_DIM_2X,
                  ),
                  SizedBox(
                    width: AUTH_CONTAINER_WIDTH,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        HalfButton(
                          title: LocaleKeys.login.tr(),
                          onTap: () => _login(context),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: NORMAL_DIM_3X),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          LocaleKeys.forget_password.tr(),
                          style: TextStyle(
                            fontFamily: LocaleKeys.fontfamily,
                            decoration: TextDecoration.underline,
                            fontSize: TEXT_SMALL,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: TextButton(
                      onPressed: () => MRouter.to(context, RegisterScreen()),
                      child: Text(
                        LocaleKeys.create_acc.tr(),
                        style: TextStyle(
                          fontFamily: LocaleKeys.fontfamily.tr(),
                          decoration: TextDecoration.underline,
                          color: Color(PRIMARY_COLOR),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _login(BuildContext context) {
    showLoadingDialog(
      context,
    );
    Provider.of<AuthBloc>(context, listen: false)
        .login(_username.text, _password.text)
        .then((value) {
      hideDialog(context);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => App()), (route) => false);
    }).catchError((onError) {
      hideDialog(context);
      showErrorDialog(context, message: onError);
    });
  }
}
