import 'package:mBet/data/models/impl/cart_model_impl.dart';
import 'package:mBet/persistence/entities/tickets/ticket_wrapper.dart';
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
      await Future.wait(cartList.map((element) {
        return _cartModelImpl
            .checkoutTicket(element.ticketGroup.id)
            .then((value) {
          cartList.remove(element);
          refreshUI();
        });
      }).toList());
    } catch (e) {
      return Future.error(e);
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
}
