import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('TicketGroup')
class TicketGroupTable extends Table {
  IntColumn get id => integer()();
  IntColumn get type_id => integer()();
  IntColumn get times => integer()();
  TextColumn get name => text().nullable()();
  TextColumn get merchant => text()();

  @override
  Set<Column> get primaryKey => {id};
}
