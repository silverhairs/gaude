import 'package:equatable/equatable.dart';

abstract class AccountCredential with EquatableMixin {
  const AccountCredential();
}

class GoogleAccountCredential extends AccountCredential {
  const GoogleAccountCredential({
    required this.idToken,
    required this.accessToken,
  });

  final String idToken;
  final String accessToken;

  @override
  List<String> get props => [idToken, accessToken];
}
