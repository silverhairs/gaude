library app;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/di/di.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

export 'configs/app_config.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        InjectedBlocProvider<BottomTabNavigationCubit>(),
        InjectedBlocProvider<AppSettingsCubit>(
          onCreate: (cubit) => cubit.loadAppSettings(),
        ),
        InjectedBlocProvider<AccountCubit>(),
        InjectedBlocProvider<AuthenticationBloc>(),
      ],
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget with WidgetsBindingObserver {
  const _AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: AppTheme.primarySwatch,
        scaffoldBackgroundColor: AppTheme.getBackgroundColor(context),
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: AppTheme.getSolidTextColor(context),
          displayColor: AppTheme.getSolidTextColor(context),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(Dimens.outerPadding),
            foregroundColor: AppColors.light,
            backgroundColor: AppTheme.primarySwatch,
            textStyle: GoogleFonts.poppinsTextTheme().bodyText1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.radiusButton),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(Dimens.outerPadding),
            backgroundColor: AppColors.violet20,
            foregroundColor: AppTheme.primarySwatch,
            textStyle: GoogleFonts.poppinsTextTheme().bodyText1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.radiusButton),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppTheme.getBackgroundColor(context),
          actionsIconTheme: const IconThemeData(
            color: AppColors.violet,
            size: 24,
          ),
          centerTitle: true,
          foregroundColor: AppTheme.getSolidTextColor(context),
          iconTheme: IconThemeData(
            color: AppTheme.getSolidTextColor(context),
            size: 24,
          ),
        ),
        listTileTheme: const ListTileThemeData(iconColor: AppColors.violet),
      ),
      home: MultiBlocListener(
        listeners: [
          AuthenticationFailureListener(),
          AuthenticationSuccessListener(onAuthenticated: _onUserAuthenticated),
          EmptySettingsListener(),
        ],
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) => state.maybeWhen<Widget>(
            loading: () => const Scaffold(
              body: Center(child: CenteredCircledIndicator()),
            ),
            authenticated: (account) => const MainPage(
              pages: {
                BottomBarTab.home: HomePage(),
                BottomBarTab.transactions: TransacionsPage(),
                BottomBarTab.budget: BudgetPage(),
                BottomBarTab.profile: ProfilePage(),
              },
            ),
            orElse: () => const LoginPage(),
          ),
        ),
      ),
    );
  }

  void _onUserAuthenticated(AccountUser user) {
    inject<AccountCubit>().backupAccountData(Account(user: user));
    final appSettingsCubit = inject<AppSettingsCubit>();
    appSettingsCubit.state.mapOrNull<void>(
      loaded: (loaded) {
        if (loaded.appSettings.onboardingStatus != OnboardingStatus.completed) {
          appSettingsCubit.saveAppSettings(
            loaded.appSettings.copyWith(
              onboardingStatus: OnboardingStatus.completed,
            ),
          );
        }
      },
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.ellipsis_horizontal),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(Dimens.outerPadding),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Notification Page'),
          ],
        ),
      ),
    );
  }
}
