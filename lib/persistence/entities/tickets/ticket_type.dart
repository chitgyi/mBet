import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('TicketType')
class TicketTypeTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().nullable()();
  IntColumn get price => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
