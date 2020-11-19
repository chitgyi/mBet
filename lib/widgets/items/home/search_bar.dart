import 'package:flutter/material.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/dims.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: NORMAL_DIM_2X),
      decoration: BoxDecoration(
        color: Color(LIGHT_GREY),
        borderRadius: BorderRadius.circular(LARGE_DIM),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: NORMAL_DIM_2X),
        child: Text(
          'Search Here',
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
