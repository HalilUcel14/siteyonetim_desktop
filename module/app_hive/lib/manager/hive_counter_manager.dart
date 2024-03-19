import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';

class IHiveCounterManager<T> extends IHiveManager<T> {
  IHiveCounterManager() : super();

  final HiveEventListener _listener = HiveEventListener();

  @override
  T? readBox(String id) {
    _listener.readPlus();
    return super.readBox(id);
  }

  @override
  List<T> listBox() {
    final list = super.listBox();
    _listener.readPlus(add: list.length);
    return list;
  }

  @override
  Future<bool> addBox(String id, T item) {
    _listener.writePlus();
    return super.addBox(id, item);
  }

  @override
  Future<bool> updateBox(String id, T item) {
    _listener.updatePlus();
    return super.updateBox(id, item);
  }

  @override
  Future<bool> deleteBox(String id) {
    _listener.deletePlus();
    return super.deleteBox(id);
  }
}

class HiveEventListener extends ValueNotifier<HiveEventCounter> {
  HiveEventListener()
      : super(HiveEventCounter(
          read: 0,
          write: 0,
          delete: 0,
          update: 0,
        ));

  void readPlus({int? add}) {
    add != null
        ? value = value.copyWith(read: value.read + add)
        : value = value.copyWith(read: value.read + 1);
    value.toString();
  }

  void writePlus({int? add}) {
    add != null
        ? value = value.copyWith(write: value.write + add)
        : value = value.copyWith(write: value.write + 1);
    value.toString();
  }

  void deletePlus({int? add}) {
    add != null
        ? value = value.copyWith(delete: value.delete + add)
        : value = value.copyWith(delete: value.delete + 1);
    value.toString();
  }

  void updatePlus({int? add}) {
    add != null
        ? value = value.copyWith(update: value.update + add)
        : value = value.copyWith(update: value.update + 1);
    value.toString();
  }
}

class HiveEventCounter {
  int read;
  int write;
  int delete;
  int update;

  HiveEventCounter({
    required this.read,
    required this.write,
    required this.delete,
    required this.update,
  });

  HiveEventCounter copyWith({int? read, int? write, int? delete, int? update}) {
    return HiveEventCounter(
      read: read ?? this.read,
      write: write ?? this.write,
      delete: delete ?? this.delete,
      update: update ?? this.update,
    );
  }

  @override
  String toString() {
    return 'Current Event Read: $read, Write: $write, Delete: $delete, Update: $update';
  }
}
