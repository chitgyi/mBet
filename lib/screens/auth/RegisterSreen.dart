import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mBet/generated/locale_keys.g.dart';
import 'package:mBet/screens/App.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/utils/const/font_size.dart';
import 'package:mBet/utils/const/illustrations.dart';
import 'package:mBet/utils/router.dart';
import 'package:mBet/widgets/items/auth_text_field.dart';
import 'package:mBet/widgets/items/half_button.dart';
import 'package:mBet/widgets/views/background_wrapper.dart';
import 'package:easy_localization/easy_localization.dart';

class RegisterScreen extends StatelessWidget {
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
                    Illustrations.register,
                    fit: BoxFit.contain,
                    width: AUTH_IMG_SIZE,
                    height: AUTH_IMG_SIZE,
                  ),
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: NORMAL_DIM_3X),
                      child: Text(
                        LocaleKeys.create_new_acc.tr(),
                        style: GoogleFonts.gabriela(
                          fontSize: TEXT_LARGE,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  AuthTextField(
                    hintText: LocaleKeys.username.tr(),
                    iconData: Icons.person,
                  ),
                  SizedBox(
                    height: NORMAL_DIM_2X,
                  ),
                  AuthTextField(
                    hintText: LocaleKeys.password.tr(),
                    isSecure: true,
                    iconData: Icons.lock,
                  ),
                  SizedBox(
                    height: NORMAL_DIM_2X,
                  ),
                  AuthTextField(
                    hintText: LocaleKeys.confirm_password.tr(),
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
                          title: LocaleKeys.register.tr(),
                          onTap: () => MRouter.to(context, App()),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        LocaleKeys.already_acc.tr(),
                        style: TextStyle(
                          fontFamily: LocaleKeys.fontfamily,
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
}
