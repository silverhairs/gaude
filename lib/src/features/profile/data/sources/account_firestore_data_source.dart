import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gaude/src/features/profile/data/models/account.dart';
import 'package:gaude/src/features/profile/data/sources/account_data_source.dart';
import 'package:gaude/src/shared/utils/exceptions.dart';

class AccountFirestoreDataSource implements AccountDataSource {
  AccountFirestoreDataSource(FirebaseFirestore firestore)
      : _firestore = firestore {
    _collection = _firestore.collection('accounts');
  }

  final FirebaseFirestore _firestore;
  late final CollectionReference _collection;

  @override
  Future<void> deleteAccount(String id) async {
    try {
      await _collection.doc(id).delete();
    } on FirebaseException catch (e) {
      throw DataSourceException(
        e.message ?? e.code,
        stackTrace: StackTrace.current,
      );
    } catch (e) {
      throw DataSourceException(
        e.toString(),
        stackTrace: StackTrace.current,
      );
    }
  }

  @override
  Future<Account?> getAccount(String id) async {
    try {
      final doc = await _getDocument(id);
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        return Account.fromJson(data);
      }
    } on FirebaseException catch (e) {
      throw DataSourceException(
        e.message ?? e.code,
        stackTrace: StackTrace.current,
      );
    } catch (e) {
      throw DataSourceException(
        e.toString(),
        stackTrace: StackTrace.current,
      );
    }
    return null;
  }

  @override
  Future<void> saveAccount(Account account) async {
    try {
      await _collection.doc(account.user.id).set(account.toJson()).then(
        (_) {
          return _getDocument(account.user.id);
        },
      ).catchError(
        (error, stackTrace) {},
      );
    } on FirebaseException catch (e) {
      throw DataSourceException(
        e.message ?? e.code,
        stackTrace: StackTrace.current,
      );
    } catch (e) {
      throw DataSourceException(e.toString(), stackTrace: StackTrace.current);
    }
  }

  Future<DocumentSnapshot> _getDocument(String id) async {
    final doc = await _collection.doc(id).get();

    return doc;
  }
}
