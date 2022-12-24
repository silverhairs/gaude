import 'dart:async';

import 'package:gaude/src/features/security/data/models/user_pin.dart';

abstract class UserPinDataSource {
  FutureOr<UserPin?> getUserPin();
  FutureOr<void> setUserPin(UserPin userPin);
}
