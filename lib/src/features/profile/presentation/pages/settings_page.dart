import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:ionicons/ionicons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const currencyTileKey = 'currency';
  static const languageTileKey = 'language';
  static const brightnessTileKey = 'theme';
  static const securityTileKey = 'security';
  static const notificationsTileKey = 'notifications';

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
                  key: const ValueKey(currencyTileKey),
                  title: 'Currency',
                  onTap: () => context.navigateTo(SettingsCurrencyPage(
                    settings: account.settings!,
                  )),
                  trailingText: account.settings!.currency.code,
                ),
                const SizedBox(height: Dimens.outerPadding),
                _SettingListTile(
                  key: const ValueKey(languageTileKey),
                  isEnabled: false,
                  title: 'Language',
                  onTap: () {},
                ),
                const SizedBox(height: Dimens.outerPadding),
                _SettingListTile(
                  isEnabled: false,
                  key: const ValueKey(brightnessTileKey),
                  title: 'Brightness',
                  trailingText: account.settings!.brightness.name,
                  onTap: () {},
                ),
                const SizedBox(height: Dimens.outerPadding),
                _SettingListTile(
                  key: const ValueKey(securityTileKey),
                  title: 'Security',
                  trailingText: account.settings!.security.name,
                  onTap: () {},
                ),
                const SizedBox(height: Dimens.outerPadding),
                _SettingListTile(
                  key: const ValueKey(notificationsTileKey),
                  title: 'Notifications',
                  onTap: () {},
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
                      style: context.textTheme.caption?.apply(
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
