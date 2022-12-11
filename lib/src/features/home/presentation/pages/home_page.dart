import 'package:flutter/material.dart';
import 'package:gaude/src/app/app.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const notificationsIconKey = ValueKey('NOTIFICATIONS_ICON');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: [
          IconButton(
            key: notificationsIconKey,
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
          children: const [
            Text(
              'Account Balance',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
