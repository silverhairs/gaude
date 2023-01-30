import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/firebase_options_dev.dart';
import 'package:gaude/src/app/bloc_observer.dart';
import 'package:gaude/src/di/di.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:logger/logger.dart';

import 'src/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Injector.configure(
    AppConfig(
      logLevel: AppConfig.getLogLevelFromEnvironment(
        defaultLevel: Level.verbose,
      ),
    ),
  );

  final auditor = inject<CrashReportService>();
  FlutterError.onError = auditor.recordFlutterError;
  Bloc.observer = LogBlocObserver();
  await _setupLocalDatabase();

  await auditor.runZonedGuardedWithCrashReport(() => runApp(const App()));
}

Future<void> _setupLocalDatabase() async {
  final db = inject<Database>();
  if (db is ExternalConnection) {
    try {
      final connection = db as ExternalConnection;
      await connection.start();
    } catch (e, s) {
      await inject<CrashReportService>().recordException(
        Failure(e, s),
        isFatal: true,
      );
    }
  }
}

Future<void> useFirebaseEmulator({
  int authPort = 9099,
  int firestorePort = 8080,
  String? host,
}) async {
  if (kDebugMode) {
    final localhost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    inject<FirebaseFirestore>().useFirestoreEmulator(
      host ?? localhost,
      firestorePort,
    );
    await inject<FirebaseAuth>().useAuthEmulator(
      host ?? localhost,
      authPort,
    );
  }
}
