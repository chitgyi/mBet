import 'package:mBet/persistence/database.dart';

class TicketDataWrapper {
  final TicketGroup ticketGroup;
  final List<Ticket> tickets;
  final TicketType type;

  TicketDataWrapper({
    this.ticketGroup,
    this.tickets,
    this.type,
  });

  String get ticketNumbers {
    String str = '';
    tickets.asMap().entries.forEach((e) => str += "${e.value.ticket_num}။    ");
    return str;
  }
}
