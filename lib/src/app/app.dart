library app;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        InjectedBlocProvider<AuthenticationBloc>(),
        InjectedBlocProvider<BottomTabNavigationCubit>(),
      ],
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
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
          iconTheme: const IconThemeData(
            color: AppColors.violet,
            size: 24,
          ),
        ),
      ),
      home: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          state.maybeWhen(
            failed: (failure) {
              final error = failure.error;
              final message = error is GaudeException
                  ? error.message
                  : 'Check your internet connection and try again!';
              NotificationFlushbar(
                title: 'Sign In Failed',
                message: message,
              ).show(context);
            },
            orElse: () {},
          );
        },
        builder: (context, state) => state.maybeWhen<Widget>(
          loading: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          authenticated: (account) => MainPage(
            pages: {
              BottomBarTab.home: WelcomePage(account: account),
              BottomBarTab.transactions: Container(color: AppColors.violet40),
              BottomBarTab.budget: Container(color: AppColors.green40),
              BottomBarTab.profile: Container(color: AppColors.red40),
            },
          ),
          orElse: () => const LoginPage(),
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key, required this.account});

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: [
          IconButton(
            icon: const Icon(Ionicons.notifications),
            onPressed: () async => context.navigateTo(const NotificationPage()),
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
          children: [
            Text('Welcome ${account.name}'),
            const SizedBox(height: Dimens.largePadding),
            TextButton(
              onPressed: () {
                context.read<AuthenticationBloc>().add(
                      const AuthenticationLogout(),
                    );
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
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
