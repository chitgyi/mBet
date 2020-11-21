import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('Ticket')
class TicketTable extends Table {
  IntColumn get id => integer()();
  // ignore: non_constant_identifier_names
  TextColumn get ticket_num => text()();
  // ignore: non_constant_identifier_names
  IntColumn get ticket_group_id => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
