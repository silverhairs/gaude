import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/features/authentication/logic/bloc/authentication_bloc.dart';
import 'package:gaude/src/shared/shared.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(Dimens.outerPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex: 2, child: Image.asset(AppImages.payingHand)),
            Text(
              'Gain total control over your finances.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: Dimens.outerPadding),
            Text(
              'Become your own money manager and make every cent count',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: Dimens.outerPadding),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Dimens.outerPadding,
              ),
              child: ElevatedButton(
                onPressed: () => NotificationFlushbar(
                  title: 'Sign In Error',
                  message: 'Not implemented yet',
                ).show(context),
                child: const Text('Sign Up'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Dimens.outerPadding,
              ),
              child: TextButton(
                onPressed: () {
                  context.read<AuthenticationBloc>().add(
                        const AuthenticationLoginWithGoogle(),
                      );
                },
                child: const Text('Continue with Google'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
