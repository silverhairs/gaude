import 'package:gaude/src/features/profile/data/models/account.dart';
import 'package:gaude/src/features/profile/data/sources/account_data_source.dart';
import 'package:mocktail/mocktail.dart';

import '../authentication/fakes.dart';
import '../interfaces.dart';

typedef Stub<T> = When<T> Function();

class MockAccountDataSource extends Mock implements AccountDataSource {}

class AccountDataSourceStubs implements StubsManager {
  AccountDataSourceStubs(this.dataSource) {
    registerFallbackValue(testAccount);
  }
  final AccountDataSource dataSource;

  When<Future<Account?>> _getAccount() =>
      when<Future<Account?>>(() => dataSource.getAccount(any()));
  When<Future<void>> _saveAccount() =>
      when(() => dataSource.saveAccount(any<Account>()));
  When<Future<void>> _deleteAccount() =>
      when(() => dataSource.deleteAccount(any()));

  @override
  void setupStubs({bool success = true}) {
    final stubs = <Stub>[_getAccount, _saveAccount, _deleteAccount];
    for (final stub in stubs) {
      _attachOutput(stub(), success);
    }
  }

  void _attachOutput(When result, bool success) {
    if (success) {
      if (result is When<Future<Account?>>) {
        result.thenAnswer((_) => Future.value(testAccount));
      } else {
        result.thenAnswer((_) => Future.value());
      }
      return;
    }
    if (result is When<Future<Account?>>) {
      result.thenAnswer((_) => Future.value(null));
    } else {
      result.thenThrow(testDataSourceException);
    }
  }
}
