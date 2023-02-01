import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaude/src/features/profile/data/models/account.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';

class FakeCrashlytics extends Fake implements FirebaseCrashlytics {
  @override
  Future<void> recordError(exception, StackTrace? stack,
      {reason,
      Iterable<Object> information = const [],
      bool? printDetails,
      bool fatal = false}) async {
    return;
  }

  @override
  Future<void> recordFlutterError(
    FlutterErrorDetails flutterErrorDetails, {
    bool fatal = false,
  }) async {
    return;
  }
}

abstract class FirestoreSetup {
  static void setData(
    FakeFirebaseFirestore instance, {
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) {
    instance.collection(collection).doc(documentId).set(data);
  }
}

extension AccountX on Account {
  MockUser getFirebaseMockUser() {
    return MockUser(
      uid: user.id,
      email: user.email,
      displayName: user.name,
      photoURL: user.photoUrl,
    );
  }
}

class MockGoogleSignIn extends Mock implements GoogleSignIn {
  MockGoogleSignInAccount? _currentUser;
  bool _isCancelled = false;

  /// Used to simulate google login cancellation behaviour.
  void setIsCancelled(bool val) {
    _isCancelled = val;
  }

  @override
  GoogleSignInAccount? get currentUser => _currentUser;
  @override
  Future<GoogleSignInAccount?> signIn() {
    _currentUser = MockGoogleSignInAccount();
    return Future.value(_isCancelled ? null : _currentUser);
  }

  @override
  Future<GoogleSignInAccount?> signOut() {
    final currentUser = _currentUser;
    _currentUser = null;
    return Future.value(_isCancelled ? null : currentUser);
  }
}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {
  @override
  Future<GoogleSignInAuthentication> get authentication =>
      Future.value(MockGoogleSignInAuthentication());

  @override
  int get hashCode => Object.hashAll([
        authentication,
        authHeaders,
        email,
        displayName,
        id,
        photoUrl,
        serverAuthCode,
      ]);

  @override
  bool operator ==(other) {
    return (other is Mock)
        ? hashCode == other.hashCode
        : identical(this, other);
  }
}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {
  @override
  String get idToken => 'idToken';

  @override
  String get accessToken => 'accessToken';
}
