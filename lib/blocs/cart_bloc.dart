import 'package:mBet/data/models/impl/cart_model_impl.dart';
import 'package:mBet/network/response/order_response.dart';
import 'package:mBet/persistence/entities/tickets/ticket_wrapper.dart';
import 'package:mBet/utils/const/api_contants.dart';
import 'package:mBet/utils/const/string_constants.dart';
import 'package:mBet/utils/state_controller.dart';

class CartBloc extends StateController {
  CartModelImpl _cartModelImpl;
  int _totalAmount = 0;
  CartBloc() {
    _cartModelImpl = CartModelImpl();
  }
  List<TicketDataWrapper> cartList = [];

  Future<void> checkoutTickets() async {
    try {
      // Check Balance
      int myAmount = 10000;
      if (totalMount > myAmount) {
        throw Exception(LOW_BALANGE_MSG);
      }
      // Checkout Orders
      OrderResponse response =
          await _cartModelImpl.checkoutTicket(_requestData());
      print(response.toJson());
      _updateCartList(response.data.successIDs);
      refreshUI();
      if (response.data.failedIDs.isNotEmpty) {
        throw Exception(ALREADY_PURCHASED_BY_ANOTHER);
      } else if (response.message.contains('Your Amount is Low')) {
        throw Exception(LOW_BALANGE_MSG);
      }
    } catch (e) {
      return Future.error(e.message);
    }
  }

  int get totalMount {
    _totalAmount = 0;
    cartList.forEach((e) => _totalAmount += e.type.price);
    return _totalAmount;
  }

  bool addItem(TicketDataWrapper data) {
    bool isNotExist = cartList.firstWhere(
            (element) => element.ticketGroup.id == data.ticketGroup.id,
            orElse: () => null) ==
        null;
    if (isNotExist) {
      cartList.add(data);
      return true;
    } else {
      return false;
    }
  }

  void remove(TicketDataWrapper data) {
    cartList.remove(data);
    refreshUI();
  }

  void _updateCartList(List<Map<String, int>> data) {
    data.forEach((data) {
      var tmp = cartList.firstWhere(
          (element) => element.ticketGroup.id == data[TICKET_GROUP_ID_KEY]);
      cartList.remove(tmp);
    });
  }

  Map<String, dynamic> _requestData() {
    return {
      TICKETS_KEY: cartList
          .map(
            (e) => {
              TICKET_GROUP_ID_KEY: e.ticketGroup.id,
            },
          )
          .toList()
    };
  }
}
