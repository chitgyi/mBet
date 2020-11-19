import 'package:flutter/material.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:easy_localization/easy_localization.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.locale = Locale('en'),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: NORMAL_DIM + SMALL_DIM),
        decoration: BoxDecoration(
          color: Color(LIGHT_GREY),
          borderRadius: BorderRadius.circular(LARGE_DIM),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: NORMAL_DIM_2X),
          child: Row(
            children: [
              Text(
                'Search Here',
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
              Spacer(),
              Icon(
                Icons.search,
                color: Colors.black45,
              )
            ],
          ),
        ),
      ),
    );
  }
}
