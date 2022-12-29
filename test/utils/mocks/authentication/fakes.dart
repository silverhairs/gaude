import 'package:gaude/src/features/authentication/data/models/account_user.dart';
import 'package:gaude/src/features/profile/data/models/account.dart';
import 'package:gaude/src/features/profile/data/models/account_settings.dart';
import 'package:gaude/src/shared/models/currency.dart';
import 'package:gaude/src/shared/utils/consts/popular_currencies.dart';
import 'package:gaude/src/shared/utils/exceptions.dart';

const testUser = AccountUser(
  id: 'id',
  email: 'tester@email.com',
  name: 'Tester Doe',
  photoUrl: 'https://example.com/photo.png',
);

final testAccountSettings = AccountSettings(
  currency: Currency.fromJson(kPopularCurrencies.first),
  updatedAt: DateTime.now(),
);

final testAccount = Account(
  user: testUser,
  settings: testAccountSettings,
);

const testDataSourceException = DataSourceException(
  'Test DataSource Exception',
  stackTrace: StackTrace.empty,
);
