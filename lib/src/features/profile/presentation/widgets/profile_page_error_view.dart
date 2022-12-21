import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';

class ProfileErrorView extends StatelessWidget {
  const ProfileErrorView({super.key});

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
    context.read<AuthenticationBloc>().state.whenOrNull(
          authenticated: (account) => context.read<AccountCubit>().getAccount(
                account.id,
              ),
        );
  }
}
