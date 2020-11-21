// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class TicketGroup extends DataClass implements Insertable<TicketGroup> {
  final int id;
  final int type_id;
  final int times;
  final String name;
  final String merchant;
  TicketGroup(
      {@required this.id,
      @required this.type_id,
      @required this.times,
      this.name,
      @required this.merchant});
  factory TicketGroup.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return TicketGroup(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      type_id:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}type_id']),
      times: intType.mapFromDatabaseResponse(data['${effectivePrefix}times']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      merchant: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}merchant']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || type_id != null) {
      map['type_id'] = Variable<int>(type_id);
    }
    if (!nullToAbsent || times != null) {
      map['times'] = Variable<int>(times);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || merchant != null) {
      map['merchant'] = Variable<String>(merchant);
    }
    return map;
  }

  TicketGroupTableCompanion toCompanion(bool nullToAbsent) {
    return TicketGroupTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      type_id: type_id == null && nullToAbsent
          ? const Value.absent()
          : Value(type_id),
      times:
          times == null && nullToAbsent ? const Value.absent() : Value(times),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      merchant: merchant == null && nullToAbsent
          ? const Value.absent()
          : Value(merchant),
    );
  }

  factory TicketGroup.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TicketGroup(
      id: serializer.fromJson<int>(json['id']),
      type_id: serializer.fromJson<int>(json['type_id']),
      times: serializer.fromJson<int>(json['times']),
      name: serializer.fromJson<String>(json['name']),
      merchant: serializer.fromJson<String>(json['merchant']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type_id': serializer.toJson<int>(type_id),
      'times': serializer.toJson<int>(times),
      'name': serializer.toJson<String>(name),
      'merchant': serializer.toJson<String>(merchant),
    };
  }

  TicketGroup copyWith(
          {int id, int type_id, int times, String name, String merchant}) =>
      TicketGroup(
        id: id ?? this.id,
        type_id: type_id ?? this.type_id,
        times: times ?? this.times,
        name: name ?? this.name,
        merchant: merchant ?? this.merchant,
      );
  @override
  String toString() {
    return (StringBuffer('TicketGroup(')
          ..write('id: $id, ')
          ..write('type_id: $type_id, ')
          ..write('times: $times, ')
          ..write('name: $name, ')
          ..write('merchant: $merchant')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(type_id.hashCode,
          $mrjc(times.hashCode, $mrjc(name.hashCode, merchant.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TicketGroup &&
          other.id == this.id &&
          other.type_id == this.type_id &&
          other.times == this.times &&
          other.name == this.name &&
          other.merchant == this.merchant);
}

class TicketGroupTableCompanion extends UpdateCompanion<TicketGroup> {
  final Value<int> id;
  final Value<int> type_id;
  final Value<int> times;
  final Value<String> name;
  final Value<String> merchant;
  const TicketGroupTableCompanion({
    this.id = const Value.absent(),
    this.type_id = const Value.absent(),
    this.times = const Value.absent(),
    this.name = const Value.absent(),
    this.merchant = const Value.absent(),
  });
  TicketGroupTableCompanion.insert({
    this.id = const Value.absent(),
    @required int type_id,
    @required int times,
    this.name = const Value.absent(),
    @required String merchant,
  })  : type_id = Value(type_id),
        times = Value(times),
        merchant = Value(merchant);
  static Insertable<TicketGroup> custom({
    Expression<int> id,
    Expression<int> type_id,
    Expression<int> times,
    Expression<String> name,
    Expression<String> merchant,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type_id != null) 'type_id': type_id,
      if (times != null) 'times': times,
      if (name != null) 'name': name,
      if (merchant != null) 'merchant': merchant,
    });
  }

  TicketGroupTableCompanion copyWith(
      {Value<int> id,
      Value<int> type_id,
      Value<int> times,
      Value<String> name,
      Value<String> merchant}) {
    return TicketGroupTableCompanion(
      id: id ?? this.id,
      type_id: type_id ?? this.type_id,
      times: times ?? this.times,
      name: name ?? this.name,
      merchant: merchant ?? this.merchant,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type_id.present) {
      map['type_id'] = Variable<int>(type_id.value);
    }
    if (times.present) {
      map['times'] = Variable<int>(times.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (merchant.present) {
      map['merchant'] = Variable<String>(merchant.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TicketGroupTableCompanion(')
          ..write('id: $id, ')
          ..write('type_id: $type_id, ')
          ..write('times: $times, ')
          ..write('name: $name, ')
          ..write('merchant: $merchant')
          ..write(')'))
        .toString();
  }
}

class $TicketGroupTableTable extends TicketGroupTable
    with TableInfo<$TicketGroupTableTable, TicketGroup> {
  final GeneratedDatabase _db;
  final String _alias;
  $TicketGroupTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _type_idMeta = const VerificationMeta('type_id');
  GeneratedIntColumn _type_id;
  @override
  GeneratedIntColumn get type_id => _type_id ??= _constructTypeId();
  GeneratedIntColumn _constructTypeId() {
    return GeneratedIntColumn(
      'type_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timesMeta = const VerificationMeta('times');
  GeneratedIntColumn _times;
  @override
  GeneratedIntColumn get times => _times ??= _constructTimes();
  GeneratedIntColumn _constructTimes() {
    return GeneratedIntColumn(
      'times',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _merchantMeta = const VerificationMeta('merchant');
  GeneratedTextColumn _merchant;
  @override
  GeneratedTextColumn get merchant => _merchant ??= _constructMerchant();
  GeneratedTextColumn _constructMerchant() {
    return GeneratedTextColumn(
      'merchant',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, type_id, times, name, merchant];
  @override
  $TicketGroupTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'ticket_group_table';
  @override
  final String actualTableName = 'ticket_group_table';
  @override
  VerificationContext validateIntegrity(Insertable<TicketGroup> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('type_id')) {
      context.handle(_type_idMeta,
          type_id.isAcceptableOrUnknown(data['type_id'], _type_idMeta));
    } else if (isInserting) {
      context.missing(_type_idMeta);
    }
    if (data.containsKey('times')) {
      context.handle(
          _timesMeta, times.isAcceptableOrUnknown(data['times'], _timesMeta));
    } else if (isInserting) {
      context.missing(_timesMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('merchant')) {
      context.handle(_merchantMeta,
          merchant.isAcceptableOrUnknown(data['merchant'], _merchantMeta));
    } else if (isInserting) {
      context.missing(_merchantMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TicketGroup map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TicketGroup.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TicketGroupTableTable createAlias(String alias) {
    return $TicketGroupTableTable(_db, alias);
  }
}

class TicketType extends DataClass implements Insertable<TicketType> {
  final int id;
  final String name;
  final int price;
  TicketType({@required this.id, this.name, @required this.price});
  factory TicketType.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return TicketType(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      price: intType.mapFromDatabaseResponse(data['${effectivePrefix}price']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<int>(price);
    }
    return map;
  }

  TicketTypeTableCompanion toCompanion(bool nullToAbsent) {
    return TicketTypeTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
    );
  }

  factory TicketType.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TicketType(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<int>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<int>(price),
    };
  }

  TicketType copyWith({int id, String name, int price}) => TicketType(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('TicketType(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, price.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TicketType &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price);
}

class TicketTypeTableCompanion extends UpdateCompanion<TicketType> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> price;
  const TicketTypeTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
  });
  TicketTypeTableCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    @required int price,
  }) : price = Value(price);
  static Insertable<TicketType> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<int> price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
    });
  }

  TicketTypeTableCompanion copyWith(
      {Value<int> id, Value<String> name, Value<int> price}) {
    return TicketTypeTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TicketTypeTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $TicketTypeTableTable extends TicketTypeTable
    with TableInfo<$TicketTypeTableTable, TicketType> {
  final GeneratedDatabase _db;
  final String _alias;
  $TicketTypeTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _priceMeta = const VerificationMeta('price');
  GeneratedIntColumn _price;
  @override
  GeneratedIntColumn get price => _price ??= _constructPrice();
  GeneratedIntColumn _constructPrice() {
    return GeneratedIntColumn(
      'price',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, price];
  @override
  $TicketTypeTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'ticket_type_table';
  @override
  final String actualTableName = 'ticket_type_table';
  @override
  VerificationContext validateIntegrity(Insertable<TicketType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price'], _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TicketType map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TicketType.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TicketTypeTableTable createAlias(String alias) {
    return $TicketTypeTableTable(_db, alias);
  }
}

class Ticket extends DataClass implements Insertable<Ticket> {
  final int id;
  final String ticket_num;
  final int ticket_group_id;
  Ticket(
      {@required this.id,
      @required this.ticket_num,
      @required this.ticket_group_id});
  factory Ticket.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Ticket(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      ticket_num: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}ticket_num']),
      ticket_group_id: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}ticket_group_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || ticket_num != null) {
      map['ticket_num'] = Variable<String>(ticket_num);
    }
    if (!nullToAbsent || ticket_group_id != null) {
      map['ticket_group_id'] = Variable<int>(ticket_group_id);
    }
    return map;
  }

  TicketTableCompanion toCompanion(bool nullToAbsent) {
    return TicketTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      ticket_num: ticket_num == null && nullToAbsent
          ? const Value.absent()
          : Value(ticket_num),
      ticket_group_id: ticket_group_id == null && nullToAbsent
          ? const Value.absent()
          : Value(ticket_group_id),
    );
  }

  factory Ticket.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Ticket(
      id: serializer.fromJson<int>(json['id']),
      ticket_num: serializer.fromJson<String>(json['ticket_num']),
      ticket_group_id: serializer.fromJson<int>(json['ticket_group_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ticket_num': serializer.toJson<String>(ticket_num),
      'ticket_group_id': serializer.toJson<int>(ticket_group_id),
    };
  }

  Ticket copyWith({int id, String ticket_num, int ticket_group_id}) => Ticket(
        id: id ?? this.id,
        ticket_num: ticket_num ?? this.ticket_num,
        ticket_group_id: ticket_group_id ?? this.ticket_group_id,
      );
  @override
  String toString() {
    return (StringBuffer('Ticket(')
          ..write('id: $id, ')
          ..write('ticket_num: $ticket_num, ')
          ..write('ticket_group_id: $ticket_group_id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(id.hashCode, $mrjc(ticket_num.hashCode, ticket_group_id.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Ticket &&
          other.id == this.id &&
          other.ticket_num == this.ticket_num &&
          other.ticket_group_id == this.ticket_group_id);
}

class TicketTableCompanion extends UpdateCompanion<Ticket> {
  final Value<int> id;
  final Value<String> ticket_num;
  final Value<int> ticket_group_id;
  const TicketTableCompanion({
    this.id = const Value.absent(),
    this.ticket_num = const Value.absent(),
    this.ticket_group_id = const Value.absent(),
  });
  TicketTableCompanion.insert({
    this.id = const Value.absent(),
    @required String ticket_num,
    @required int ticket_group_id,
  })  : ticket_num = Value(ticket_num),
        ticket_group_id = Value(ticket_group_id);
  static Insertable<Ticket> custom({
    Expression<int> id,
    Expression<String> ticket_num,
    Expression<int> ticket_group_id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ticket_num != null) 'ticket_num': ticket_num,
      if (ticket_group_id != null) 'ticket_group_id': ticket_group_id,
    });
  }

  TicketTableCompanion copyWith(
      {Value<int> id, Value<String> ticket_num, Value<int> ticket_group_id}) {
    return TicketTableCompanion(
      id: id ?? this.id,
      ticket_num: ticket_num ?? this.ticket_num,
      ticket_group_id: ticket_group_id ?? this.ticket_group_id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ticket_num.present) {
      map['ticket_num'] = Variable<String>(ticket_num.value);
    }
    if (ticket_group_id.present) {
      map['ticket_group_id'] = Variable<int>(ticket_group_id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TicketTableCompanion(')
          ..write('id: $id, ')
          ..write('ticket_num: $ticket_num, ')
          ..write('ticket_group_id: $ticket_group_id')
          ..write(')'))
        .toString();
  }
}

class $TicketTableTable extends TicketTable
    with TableInfo<$TicketTableTable, Ticket> {
  final GeneratedDatabase _db;
  final String _alias;
  $TicketTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ticket_numMeta = const VerificationMeta('ticket_num');
  GeneratedTextColumn _ticket_num;
  @override
  GeneratedTextColumn get ticket_num => _ticket_num ??= _constructTicketNum();
  GeneratedTextColumn _constructTicketNum() {
    return GeneratedTextColumn(
      'ticket_num',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ticket_group_idMeta =
      const VerificationMeta('ticket_group_id');
  GeneratedIntColumn _ticket_group_id;
  @override
  GeneratedIntColumn get ticket_group_id =>
      _ticket_group_id ??= _constructTicketGroupId();
  GeneratedIntColumn _constructTicketGroupId() {
    return GeneratedIntColumn(
      'ticket_group_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, ticket_num, ticket_group_id];
  @override
  $TicketTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'ticket_table';
  @override
  final String actualTableName = 'ticket_table';
  @override
  VerificationContext validateIntegrity(Insertable<Ticket> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('ticket_num')) {
      context.handle(
          _ticket_numMeta,
          ticket_num.isAcceptableOrUnknown(
              data['ticket_num'], _ticket_numMeta));
    } else if (isInserting) {
      context.missing(_ticket_numMeta);
    }
    if (data.containsKey('ticket_group_id')) {
      context.handle(
          _ticket_group_idMeta,
          ticket_group_id.isAcceptableOrUnknown(
              data['ticket_group_id'], _ticket_group_idMeta));
    } else if (isInserting) {
      context.missing(_ticket_group_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ticket map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Ticket.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TicketTableTable createAlias(String alias) {
    return $TicketTableTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TicketGroupTableTable _ticketGroupTable;
  $TicketGroupTableTable get ticketGroupTable =>
      _ticketGroupTable ??= $TicketGroupTableTable(this);
  $TicketTypeTableTable _ticketTypeTable;
  $TicketTypeTableTable get ticketTypeTable =>
      _ticketTypeTable ??= $TicketTypeTableTable(this);
  $TicketTableTable _ticketTable;
  $TicketTableTable get ticketTable => _ticketTable ??= $TicketTableTable(this);
  TicketDao _ticketDao;
  TicketDao get ticketDao => _ticketDao ??= TicketDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [ticketGroupTable, ticketTypeTable, ticketTable];
}
