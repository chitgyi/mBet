import 'package:flutter/material.dart';
import 'package:mBet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/widgets/utils/rectangle_shape.dart';
import 'package:mBet/widgets/utils/ticket_type.dart';

class LotteryTicketItem extends StatelessWidget {
  final EdgeInsets margin;
  final TicketType ticketType;
  LotteryTicketItem({
    this.margin = EdgeInsets.zero,
    this.ticketType = TicketType.TwoTicket,
  });
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              color: Colors.black12,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '၂၀ ကြိမ်မြောက်',
                      style: TextStyle(
                        fontFamily: LocaleKeys.fontfamily.tr(),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'အောင်ဘာလေ',
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      'က ၃၃၃၉၃၉။ က ၃၃၉၄၄၄။ က ၆၆၆၆၆၉။',
                      style: TextStyle(
                        fontFamily: LocaleKeys.fontfamily.tr(),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  child: ClipPath(
                    clipper: RectangleShape(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: this.color,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(13),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: Text(
                    '၁၀၀၀ ကျပ်',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: 120 * 0.3,
                  right: 30,
                  child: Icon(Icons.add_shopping_cart, color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color get color {
    switch (ticketType) {
      case TicketType.ThreeTicket:
        return Color(GREEN);
        break;
      case TicketType.FiveTicket:
        return Color(RED);
        break;
      case TicketType.ThreeTicket:
      default:
        return Color(PRIMARY_COLOR);
        break;
    }
  }
}
