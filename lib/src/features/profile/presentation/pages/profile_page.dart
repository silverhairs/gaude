import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/app/app.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:ionicons/ionicons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) => state.maybeWhen(
        orElse: () => const _ProfileErrorView(),
        loaded: (account) => _ProfileView(account: account),
        loading: () => const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView({required this.account, Key? key}) : super(key: key);

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
            TextButton(
              onPressed: () => context.read<AuthenticationBloc>().add(
                    const AuthenticationLogout(),
                  ),
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}

class _ProfileErrorView extends StatelessWidget {
  const _ProfileErrorView();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.outerPadding),
      height: context.screenSize.height,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Uh oh... Something went wrong',
            textAlign: TextAlign.center,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.red80,
              foregroundColor: AppColors.light,
            ),
            child: const Text('Refresh'),
            onPressed: () => _reload(context),
          ),
        ],
      ),
    );
  }

  Future<void> _reload(BuildContext context) async {
    context.read<AuthenticationBloc>().state.mapOrNull(authenticated: (authed) {
      context.read<AccountCubit>().getAccount(authed.account.id);
    });
  }
}
