import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/utils/const/font_size.dart';
import 'package:mBet/utils/const/illustrations.dart';
import 'package:mBet/widgets/items/auth_text_field.dart';
import 'package:mBet/widgets/items/half_button.dart';
import 'package:mBet/widgets/views/background_wrapper.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatelessWidget {
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
                    height: LARGE_DIM_2X + MediaQuery.of(context).padding.top,
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
                        tr('please_login'),
                        style: GoogleFonts.gabriela(
                          fontSize: TEXT_LARGE,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  AuthTextField(
                    hintText: tr('username').toString(),
                    iconData: Icons.person,
                  ),
                  SizedBox(
                    height: NORMAL_DIM_2X,
                  ),
                  AuthTextField(
                    hintText: tr('password').toString(),
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
                          onTap: () {
                            EasyLocalization.of(context).locale = Locale('en');
                          },
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: NORMAL_DIM_3X),
                      child: TextButton(
                        onPressed: null,
                        child: Text(
                          tr('forget_password'),
                          style: TextStyle(
                            fontFamily: tr('fontfamily'),
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
                      onPressed: null,
                      child: Text(
                        tr('create_acc'),
                        style: TextStyle(
                          fontFamily: tr('fontfamily'),
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
