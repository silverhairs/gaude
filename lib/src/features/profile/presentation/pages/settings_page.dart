import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
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
      body: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) => state.maybeWhen(
          orElse: () => const ProfileErrorView(),
          loading: () => const CenteredCircledIndicator(),
          loaded: (account) => SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: Dimens.outerPadding),
                _SettingListTile(
                  key: SettingsPageKeys.currencyTileKey,
                  title: 'Currency',
                  onTap: () => context.navigateTo(SettingsCurrencyPage(
                    settings: account.settings!,
                  )),
                  trailingText: account.settings!.currency.code,
                ),
                const SizedBox(height: Dimens.outerPadding),
                _SettingListTile(
                  key: SettingsPageKeys.languageTileKey,
                  isEnabled: false,
                  title: 'Language',
                  onTap: () {},
                ),
                const SizedBox(height: Dimens.outerPadding),
                _SettingListTile(
                  isEnabled: false,
                  key: SettingsPageKeys.brightnessTileKey,
                  title: 'Brightness',
                  trailingText: account.settings!.brightness.name,
                  onTap: () {},
                ),
                const SizedBox(height: Dimens.outerPadding),
                _SettingListTile(
                  key: SettingsPageKeys.securityTileKey,
                  title: 'Security',
                  trailingText: account.settings!.security.name,
                  onTap: () {},
                ),
                const SizedBox(height: Dimens.outerPadding),
                _SettingListTile(
                  key: SettingsPageKeys.notificationsTileKey,
                  title: 'Notifications',
                  onTap: () => context.navigateTo(
                    SettingsNotificationsPage(settings: account.settings!),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingListTile extends StatelessWidget {
  const _SettingListTile({
    required this.title,
    required this.onTap,
    this.trailingText,
    this.isEnabled = true,
    Key? key,
  }) : super(key: key);

  final String title;

  final String? trailingText;
  final VoidCallback onTap;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: isEnabled,
      title: Text(title),
      onTap: onTap,
      trailing: FittedBox(
        child: trailingText == null
            ? const Icon(Ionicons.chevron_forward)
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      trailingText!,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const Icon(Ionicons.chevron_forward),
                  ],
                ),
              ),
      ),
    );
  }
}

@visibleForTesting
class SettingsPageKeys {
  static const currencyTileKey = ValueKey('settings-currency');
  static const languageTileKey = ValueKey('settings-language');
  static const brightnessTileKey = ValueKey('settings-theme');
  static const securityTileKey = ValueKey('settings-security');
  static const notificationsTileKey = ValueKey('settings-notifications');

  static List<ValueKey> get all => const [
        currencyTileKey,
        languageTileKey,
        brightnessTileKey,
        securityTileKey,
        notificationsTileKey,
      ];
}
