import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox.shrink(),
          actions: [
            GestureDetector(
              onTap: () {
                final settings = AccountSettings(
                  currency: Currency.fromJson(kPopularCurrencies.first),
                  updatedAt: DateTime.now(),
                );
                context.read<AccountCubit>().updateSettings(settings);
                context.popNavigator();
              },
              child: const Padding(
                padding: EdgeInsets.all(Dimens.outerPadding),
                child: Text('Skip', style: TextStyle(color: AppColors.violet)),
              ),
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(Dimens.outerPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Let's setup your account!",
                style: context.textTheme.headlineSmall,
              ),
              const SizedBox(height: Dimens.largePadding),
              const Text(
                'We need this information to personalize your experience in the app.',
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text("Let's Go"),
                      onPressed: () {},
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
