import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';

class EmptySettingsListener extends BlocListener<AccountCubit, AccountState> {
  EmptySettingsListener({
    ValueChanged<AccountSettings?>? onSettingsLoaded,
    Key? key,
  }) : super(
          key: key,
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: (account) {
                onSettingsLoaded?.call(account.settings);
                if (account.settings == null) {
                  context.navigateTo(const OnboardingPage());
                }
              },
            );
          },
        );
}
