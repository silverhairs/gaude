import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaude/src/features/profile/data/models/account.dart';

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
