import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Settings'),
      ),
      body: SizedBox(
        width: double.infinity,
        // padding: const EdgeInsets.all(Dimens.outerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: const Text('Notifications'),
              trailing: const Icon(Ionicons.chevron_forward),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
