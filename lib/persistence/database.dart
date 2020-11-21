import 'dart:io';
import 'package:mBet/persistence/daos/ticket_dao.dart';
import 'package:mBet/persistence/entities/tickets/ticket.dart';
import 'package:mBet/persistence/entities/tickets/ticket_group.dart';
import 'package:mBet/persistence/entities/tickets/ticket_type.dart';
import 'package:moor/ffi.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('${dbFolder.path}/db.sqlite');
    return VmDatabase(file);
  });
}

@UseMoor(
    daos: [TicketDao], tables: [TicketGroupTable, TicketTypeTable, TicketTable])
class MyDatabase extends _$MyDatabase {
  static final MyDatabase _db = MyDatabase._();
  MyDatabase._() : super(_openConnection());

  factory MyDatabase() => _db;

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON;');
      },
    );
  }
}
