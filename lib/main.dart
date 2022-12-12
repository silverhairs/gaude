import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/firebase_options_dev.dart';
import 'package:gaude/src/app/bloc_observer.dart';
import 'package:gaude/src/di/di.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';

import 'src/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Injector.configure();

  await inject<Database>().start();
  final auditor = inject<CrashReportRepository>();
  FlutterError.onError = auditor.recordFlutterError;
  Bloc.observer = LogBlocObserver();

  await auditor.runZonedGuardedWithCrashReport(() => runApp(const App()));
}
