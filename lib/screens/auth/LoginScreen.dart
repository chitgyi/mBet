import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/utils/const/font_size.dart';
import 'package:mBet/utils/const/illustrations.dart';
import 'package:mBet/widgets/items/auth_text_field.dart';
import 'package:mBet/widgets/items/half_button.dart';
import 'package:mBet/widgets/views/background_wrapper.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: BackgroundWrapper(
          child: SingleChildScrollView(
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
                      'Please Login',
                      style: GoogleFonts.gabriela(
                        fontSize: TEXT_LARGE,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                AuthTextField(
                  hintText: 'Username',
                  iconData: Icons.person,
                ),
                SizedBox(
                  height: NORMAL_DIM_2X,
                ),
                AuthTextField(
                  hintText: 'Password',
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
                      HalfButton(),
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
                        'Forget Password?',
                        style: GoogleFonts.gabriela(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: LARGE_DIM),
                    child: TextButton(
                      onPressed: null,
                      child: Text(
                        'Create Account?',
                        style: GoogleFonts.gabriela(
                          decoration: TextDecoration.underline,
                          color: Color(PRIMARY_COLOR),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
