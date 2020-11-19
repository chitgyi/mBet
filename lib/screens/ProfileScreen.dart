import 'package:flutter/material.dart';
import 'package:mBet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: PopupMenuButton<Locale>(
        onSelected: (locale) {
          context.locale = locale;
        },
        itemBuilder: (BuildContext context) {
          return List.generate(
            context.supportedLocales.length,
            (index) => PopupMenuItem<Locale>(
              value: context.supportedLocales[index],
              child: Text(context.supportedLocales[index].languageCode.tr()),
            ),
          );
        },
        child: Text(LocaleKeys.change_lang.tr()),
      ),
    );
  }
}
