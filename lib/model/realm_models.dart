import 'dart:typed_data';

import 'package:realm/realm.dart';
part 'realm_models.g.dart';

@RealmModel()
class _Company {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  @MapTo('_partitionKey')
  late String partitionKey;
  late String address;
  late String city;
  late int companyNumber;
  late String fullName;
  late Uint8List image;
  late String municipality;
  late String shortName;
  late int streetNumber;
  late int tin;
}

@RealmModel()
class _Job {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  @MapTo('_partitionKey')
  late String partitionKey;
  DateTime? endDate;
  String? note;
  _Operation? operation;
  late int quantity;
  late DateTime startDate;
  late int statusPrivate;
  late double totalPricePrivate;
  _Worker? worker;
}

@RealmModel()
class _Operation {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  @MapTo('_partitionKey')
  late String partitionKey;
  late bool isSelected;
  late List<_Job> jobs;
  late String name;
  late int norm;
  String? note;
  late double price;
  late double priceOvertime;
  late int privateType;
  late bool selectable;
  late List<_Worker> workers;
}

@RealmModel()
class _Worker {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  @MapTo('_partitionKey')
  late String partitionKey;
  late String firstName;
  late bool isBlocked;
  late List<_Job> jobs;
  late String lastName;
  late Uint8List nfcData;
  String? note;
  late List<_Operation> operations;
  String? password;
  late String privateRole;
}
