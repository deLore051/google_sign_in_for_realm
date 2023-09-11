// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_models.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Company extends _Company with RealmEntity, RealmObjectBase, RealmObject {
  Company(
    ObjectId id,
    String partitionKey,
    String address,
    String city,
    int companyNumber,
    String fullName,
    Uint8List image,
    String municipality,
    String shortName,
    int streetNumber,
    int tin,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, '_partitionKey', partitionKey);
    RealmObjectBase.set(this, 'address', address);
    RealmObjectBase.set(this, 'city', city);
    RealmObjectBase.set(this, 'companyNumber', companyNumber);
    RealmObjectBase.set(this, 'fullName', fullName);
    RealmObjectBase.set(this, 'image', image);
    RealmObjectBase.set(this, 'municipality', municipality);
    RealmObjectBase.set(this, 'shortName', shortName);
    RealmObjectBase.set(this, 'streetNumber', streetNumber);
    RealmObjectBase.set(this, 'tin', tin);
  }

  Company._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get partitionKey =>
      RealmObjectBase.get<String>(this, '_partitionKey') as String;
  @override
  set partitionKey(String value) =>
      RealmObjectBase.set(this, '_partitionKey', value);

  @override
  String get address => RealmObjectBase.get<String>(this, 'address') as String;
  @override
  set address(String value) => RealmObjectBase.set(this, 'address', value);

  @override
  String get city => RealmObjectBase.get<String>(this, 'city') as String;
  @override
  set city(String value) => RealmObjectBase.set(this, 'city', value);

  @override
  int get companyNumber =>
      RealmObjectBase.get<int>(this, 'companyNumber') as int;
  @override
  set companyNumber(int value) =>
      RealmObjectBase.set(this, 'companyNumber', value);

  @override
  String get fullName =>
      RealmObjectBase.get<String>(this, 'fullName') as String;
  @override
  set fullName(String value) => RealmObjectBase.set(this, 'fullName', value);

  @override
  Uint8List get image =>
      RealmObjectBase.get<Uint8List>(this, 'image') as Uint8List;
  @override
  set image(Uint8List value) => RealmObjectBase.set(this, 'image', value);

  @override
  String get municipality =>
      RealmObjectBase.get<String>(this, 'municipality') as String;
  @override
  set municipality(String value) =>
      RealmObjectBase.set(this, 'municipality', value);

  @override
  String get shortName =>
      RealmObjectBase.get<String>(this, 'shortName') as String;
  @override
  set shortName(String value) => RealmObjectBase.set(this, 'shortName', value);

  @override
  int get streetNumber => RealmObjectBase.get<int>(this, 'streetNumber') as int;
  @override
  set streetNumber(int value) =>
      RealmObjectBase.set(this, 'streetNumber', value);

  @override
  int get tin => RealmObjectBase.get<int>(this, 'tin') as int;
  @override
  set tin(int value) => RealmObjectBase.set(this, 'tin', value);

  @override
  Stream<RealmObjectChanges<Company>> get changes =>
      RealmObjectBase.getChanges<Company>(this);

  @override
  Company freeze() => RealmObjectBase.freezeObject<Company>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Company._);
    return const SchemaObject(ObjectType.realmObject, Company, 'Company', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('partitionKey', RealmPropertyType.string,
          mapTo: '_partitionKey'),
      SchemaProperty('address', RealmPropertyType.string),
      SchemaProperty('city', RealmPropertyType.string),
      SchemaProperty('companyNumber', RealmPropertyType.int),
      SchemaProperty('fullName', RealmPropertyType.string),
      SchemaProperty('image', RealmPropertyType.binary),
      SchemaProperty('municipality', RealmPropertyType.string),
      SchemaProperty('shortName', RealmPropertyType.string),
      SchemaProperty('streetNumber', RealmPropertyType.int),
      SchemaProperty('tin', RealmPropertyType.int),
    ]);
  }
}

class Job extends _Job with RealmEntity, RealmObjectBase, RealmObject {
  Job(
    ObjectId id,
    String partitionKey,
    int quantity,
    DateTime startDate,
    int statusPrivate,
    double totalPricePrivate, {
    DateTime? endDate,
    String? note,
    Operation? operation,
    Worker? worker,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, '_partitionKey', partitionKey);
    RealmObjectBase.set(this, 'endDate', endDate);
    RealmObjectBase.set(this, 'note', note);
    RealmObjectBase.set(this, 'operation', operation);
    RealmObjectBase.set(this, 'quantity', quantity);
    RealmObjectBase.set(this, 'startDate', startDate);
    RealmObjectBase.set(this, 'statusPrivate', statusPrivate);
    RealmObjectBase.set(this, 'totalPricePrivate', totalPricePrivate);
    RealmObjectBase.set(this, 'worker', worker);
  }

  Job._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get partitionKey =>
      RealmObjectBase.get<String>(this, '_partitionKey') as String;
  @override
  set partitionKey(String value) =>
      RealmObjectBase.set(this, '_partitionKey', value);

  @override
  DateTime? get endDate =>
      RealmObjectBase.get<DateTime>(this, 'endDate') as DateTime?;
  @override
  set endDate(DateTime? value) => RealmObjectBase.set(this, 'endDate', value);

  @override
  String? get note => RealmObjectBase.get<String>(this, 'note') as String?;
  @override
  set note(String? value) => RealmObjectBase.set(this, 'note', value);

  @override
  Operation? get operation =>
      RealmObjectBase.get<Operation>(this, 'operation') as Operation?;
  @override
  set operation(covariant Operation? value) =>
      RealmObjectBase.set(this, 'operation', value);

  @override
  int get quantity => RealmObjectBase.get<int>(this, 'quantity') as int;
  @override
  set quantity(int value) => RealmObjectBase.set(this, 'quantity', value);

  @override
  DateTime get startDate =>
      RealmObjectBase.get<DateTime>(this, 'startDate') as DateTime;
  @override
  set startDate(DateTime value) =>
      RealmObjectBase.set(this, 'startDate', value);

  @override
  int get statusPrivate =>
      RealmObjectBase.get<int>(this, 'statusPrivate') as int;
  @override
  set statusPrivate(int value) =>
      RealmObjectBase.set(this, 'statusPrivate', value);

  @override
  double get totalPricePrivate =>
      RealmObjectBase.get<double>(this, 'totalPricePrivate') as double;
  @override
  set totalPricePrivate(double value) =>
      RealmObjectBase.set(this, 'totalPricePrivate', value);

  @override
  Worker? get worker => RealmObjectBase.get<Worker>(this, 'worker') as Worker?;
  @override
  set worker(covariant Worker? value) =>
      RealmObjectBase.set(this, 'worker', value);

  @override
  Stream<RealmObjectChanges<Job>> get changes =>
      RealmObjectBase.getChanges<Job>(this);

  @override
  Job freeze() => RealmObjectBase.freezeObject<Job>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Job._);
    return const SchemaObject(ObjectType.realmObject, Job, 'Job', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('partitionKey', RealmPropertyType.string,
          mapTo: '_partitionKey'),
      SchemaProperty('endDate', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('note', RealmPropertyType.string, optional: true),
      SchemaProperty('operation', RealmPropertyType.object,
          optional: true, linkTarget: 'Operation'),
      SchemaProperty('quantity', RealmPropertyType.int),
      SchemaProperty('startDate', RealmPropertyType.timestamp),
      SchemaProperty('statusPrivate', RealmPropertyType.int),
      SchemaProperty('totalPricePrivate', RealmPropertyType.double),
      SchemaProperty('worker', RealmPropertyType.object,
          optional: true, linkTarget: 'Worker'),
    ]);
  }
}

class Operation extends _Operation
    with RealmEntity, RealmObjectBase, RealmObject {
  Operation(
    ObjectId id,
    String partitionKey,
    bool isSelected,
    String name,
    int norm,
    double price,
    double priceOvertime,
    int privateType,
    bool selectable, {
    String? note,
    Iterable<Job> jobs = const [],
    Iterable<Worker> workers = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, '_partitionKey', partitionKey);
    RealmObjectBase.set(this, 'isSelected', isSelected);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'norm', norm);
    RealmObjectBase.set(this, 'note', note);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'priceOvertime', priceOvertime);
    RealmObjectBase.set(this, 'privateType', privateType);
    RealmObjectBase.set(this, 'selectable', selectable);
    RealmObjectBase.set<RealmList<Job>>(this, 'jobs', RealmList<Job>(jobs));
    RealmObjectBase.set<RealmList<Worker>>(
        this, 'workers', RealmList<Worker>(workers));
  }

  Operation._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get partitionKey =>
      RealmObjectBase.get<String>(this, '_partitionKey') as String;
  @override
  set partitionKey(String value) =>
      RealmObjectBase.set(this, '_partitionKey', value);

  @override
  bool get isSelected => RealmObjectBase.get<bool>(this, 'isSelected') as bool;
  @override
  set isSelected(bool value) => RealmObjectBase.set(this, 'isSelected', value);

  @override
  RealmList<Job> get jobs =>
      RealmObjectBase.get<Job>(this, 'jobs') as RealmList<Job>;
  @override
  set jobs(covariant RealmList<Job> value) => throw RealmUnsupportedSetError();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  int get norm => RealmObjectBase.get<int>(this, 'norm') as int;
  @override
  set norm(int value) => RealmObjectBase.set(this, 'norm', value);

  @override
  String? get note => RealmObjectBase.get<String>(this, 'note') as String?;
  @override
  set note(String? value) => RealmObjectBase.set(this, 'note', value);

  @override
  double get price => RealmObjectBase.get<double>(this, 'price') as double;
  @override
  set price(double value) => RealmObjectBase.set(this, 'price', value);

  @override
  double get priceOvertime =>
      RealmObjectBase.get<double>(this, 'priceOvertime') as double;
  @override
  set priceOvertime(double value) =>
      RealmObjectBase.set(this, 'priceOvertime', value);

  @override
  int get privateType => RealmObjectBase.get<int>(this, 'privateType') as int;
  @override
  set privateType(int value) => RealmObjectBase.set(this, 'privateType', value);

  @override
  bool get selectable => RealmObjectBase.get<bool>(this, 'selectable') as bool;
  @override
  set selectable(bool value) => RealmObjectBase.set(this, 'selectable', value);

  @override
  RealmList<Worker> get workers =>
      RealmObjectBase.get<Worker>(this, 'workers') as RealmList<Worker>;
  @override
  set workers(covariant RealmList<Worker> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Operation>> get changes =>
      RealmObjectBase.getChanges<Operation>(this);

  @override
  Operation freeze() => RealmObjectBase.freezeObject<Operation>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Operation._);
    return const SchemaObject(ObjectType.realmObject, Operation, 'Operation', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('partitionKey', RealmPropertyType.string,
          mapTo: '_partitionKey'),
      SchemaProperty('isSelected', RealmPropertyType.bool),
      SchemaProperty('jobs', RealmPropertyType.object,
          linkTarget: 'Job', collectionType: RealmCollectionType.list),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('norm', RealmPropertyType.int),
      SchemaProperty('note', RealmPropertyType.string, optional: true),
      SchemaProperty('price', RealmPropertyType.double),
      SchemaProperty('priceOvertime', RealmPropertyType.double),
      SchemaProperty('privateType', RealmPropertyType.int),
      SchemaProperty('selectable', RealmPropertyType.bool),
      SchemaProperty('workers', RealmPropertyType.object,
          linkTarget: 'Worker', collectionType: RealmCollectionType.list),
    ]);
  }
}

class Worker extends _Worker with RealmEntity, RealmObjectBase, RealmObject {
  Worker(
    ObjectId id,
    String partitionKey,
    String firstName,
    bool isBlocked,
    String lastName,
    Uint8List nfcData,
    String privateRole, {
    String? note,
    String? password,
    Iterable<Job> jobs = const [],
    Iterable<Operation> operations = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, '_partitionKey', partitionKey);
    RealmObjectBase.set(this, 'firstName', firstName);
    RealmObjectBase.set(this, 'isBlocked', isBlocked);
    RealmObjectBase.set(this, 'lastName', lastName);
    RealmObjectBase.set(this, 'nfcData', nfcData);
    RealmObjectBase.set(this, 'note', note);
    RealmObjectBase.set(this, 'password', password);
    RealmObjectBase.set(this, 'privateRole', privateRole);
    RealmObjectBase.set<RealmList<Job>>(this, 'jobs', RealmList<Job>(jobs));
    RealmObjectBase.set<RealmList<Operation>>(
        this, 'operations', RealmList<Operation>(operations));
  }

  Worker._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get partitionKey =>
      RealmObjectBase.get<String>(this, '_partitionKey') as String;
  @override
  set partitionKey(String value) =>
      RealmObjectBase.set(this, '_partitionKey', value);

  @override
  String get firstName =>
      RealmObjectBase.get<String>(this, 'firstName') as String;
  @override
  set firstName(String value) => RealmObjectBase.set(this, 'firstName', value);

  @override
  bool get isBlocked => RealmObjectBase.get<bool>(this, 'isBlocked') as bool;
  @override
  set isBlocked(bool value) => RealmObjectBase.set(this, 'isBlocked', value);

  @override
  RealmList<Job> get jobs =>
      RealmObjectBase.get<Job>(this, 'jobs') as RealmList<Job>;
  @override
  set jobs(covariant RealmList<Job> value) => throw RealmUnsupportedSetError();

  @override
  String get lastName =>
      RealmObjectBase.get<String>(this, 'lastName') as String;
  @override
  set lastName(String value) => RealmObjectBase.set(this, 'lastName', value);

  @override
  Uint8List get nfcData =>
      RealmObjectBase.get<Uint8List>(this, 'nfcData') as Uint8List;
  @override
  set nfcData(Uint8List value) => RealmObjectBase.set(this, 'nfcData', value);

  @override
  String? get note => RealmObjectBase.get<String>(this, 'note') as String?;
  @override
  set note(String? value) => RealmObjectBase.set(this, 'note', value);

  @override
  RealmList<Operation> get operations =>
      RealmObjectBase.get<Operation>(this, 'operations')
          as RealmList<Operation>;
  @override
  set operations(covariant RealmList<Operation> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get password =>
      RealmObjectBase.get<String>(this, 'password') as String?;
  @override
  set password(String? value) => RealmObjectBase.set(this, 'password', value);

  @override
  String get privateRole =>
      RealmObjectBase.get<String>(this, 'privateRole') as String;
  @override
  set privateRole(String value) =>
      RealmObjectBase.set(this, 'privateRole', value);

  @override
  Stream<RealmObjectChanges<Worker>> get changes =>
      RealmObjectBase.getChanges<Worker>(this);

  @override
  Worker freeze() => RealmObjectBase.freezeObject<Worker>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Worker._);
    return const SchemaObject(ObjectType.realmObject, Worker, 'Worker', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('partitionKey', RealmPropertyType.string,
          mapTo: '_partitionKey'),
      SchemaProperty('firstName', RealmPropertyType.string),
      SchemaProperty('isBlocked', RealmPropertyType.bool),
      SchemaProperty('jobs', RealmPropertyType.object,
          linkTarget: 'Job', collectionType: RealmCollectionType.list),
      SchemaProperty('lastName', RealmPropertyType.string),
      SchemaProperty('nfcData', RealmPropertyType.binary),
      SchemaProperty('note', RealmPropertyType.string, optional: true),
      SchemaProperty('operations', RealmPropertyType.object,
          linkTarget: 'Operation', collectionType: RealmCollectionType.list),
      SchemaProperty('password', RealmPropertyType.string, optional: true),
      SchemaProperty('privateRole', RealmPropertyType.string),
    ]);
  }
}
