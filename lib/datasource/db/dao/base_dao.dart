import 'dart:async';

import '../app_database.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

// typedef SnapshotMapper<M, K> = M Function(
//     RecordSnapshot<K, Map<String, dynamic>> snapshot);

//abstract class IBaseDao<T, S> {
//  final String collectionName;
//  final StoreRef<S, Map<String, dynamic>> store;
//  final SnapshotMapper<T, S> snapshotMapper;
//}

// M = Model
// K = Key Store data type (int atau String)
abstract class BaseDao<K,M extends Mapper> {
  // implements IBaseDao<T, S> {
  @protected
  final Future<Database> db = AppDatabase.instance!.database;

  StoreRef<K, Map<String, dynamic>>? _store;

  @protected
  StoreRef<K, Map<String, dynamic>>? get store => _store;

  BaseDao({@required this.collectionName}) {
    // assert(K is int || K is String);
    if (K == int) {
      _store = intMapStoreFactory.store(collectionName)
      as StoreRef<K, Map<String, dynamic>>;
    } else if (K == String) {
      _store = stringMapStoreFactory.store(collectionName)
      as StoreRef<K, Map<String, dynamic>>;
    } else {
    }
  }

  final String? collectionName;

  @protected
  M map(Map<String, dynamic> snapshot);

  Future<M> findOne({
    @required Filter? filter,
  }) async {
    final finder = Finder(
      filter: filter, // Filter.equals('name', search)
    );
    final recordSnapshot =
    await _store?.findFirst(
      await db,
      finder: finder,
    );

    final newMap = Map<String,dynamic>.from(recordSnapshot!.value);
    newMap["_objectId"] = recordSnapshot.key;
    return map(newMap);
  }

  Future<List<M>> findMany({
    Filter? filter,
    int page = 1,
    int limit = 100,
    List<SortOrder>? sortOrders,
  }) async {
    final finder = Finder(
      filter: filter, // Filter.equals('name', search)
      offset: page > 0 ? (page - 1) * limit : 1,
      limit: limit,
      sortOrders: sortOrders,
    );

    final recordSnapshots =
    await _store?.find(
      await db,
      finder: finder,
    );

    if(recordSnapshots!.isNotEmpty){}
    return recordSnapshots.map((rs) {
      final newMap = Map<String,dynamic>.from(rs.value);
      newMap["_objectId"] = rs.key;
      return map(newMap);
    }).toList();
  }

  Future<K> insert(M value) async {
    return _store!.add(await db, value.toMap() as Map<String,dynamic>);
  }

  Future<void> update({
    @required String? id,
    Map<String, dynamic>? value,
  }) async {
    final finder = Finder(filter: Filter.byKey(id));
    await _store!.update(
      await db,
      value!,
      finder: finder,
    );
  }

  Future<void> delete({@required Filter? filter}) async {
    final finder = Finder(filter: filter);
    await _store!.delete(
      await db,
      finder: finder,
    );
  }

  Future<Z> transaction<Z>(FutureOr<Z> action(Transaction transaction)) async =>
      (await db).transaction(action);
}

abstract class Mapper {
  const Mapper();

  Map? toMap();
}
