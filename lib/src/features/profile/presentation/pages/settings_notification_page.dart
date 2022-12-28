import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';

class SettingsNotificationsPage extends StatefulWidget {
  const SettingsNotificationsPage({super.key, required this.settings});

  final AccountSettings settings;

  @override
  State<SettingsNotificationsPage> createState() =>
      _SettingsNotificationsPageState();
}

class _SettingsNotificationsPageState extends State<SettingsNotificationsPage> {
  late final Set<NotificationTypes> _enabledNotifications = {
    ...widget.settings.allowedNotifications,
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await context.read<AccountCubit>().updateSettings(
              widget.settings.copyWith(
                allowedNotifications: [..._enabledNotifications],
              ),
            );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Notifications'), elevation: 1),
        body: BlocConsumer<NotificationPermissionCubit,
            NotificationPermissionState>(
          listener: (context, state) => state.whenOrNull<void>(denied: () {
            setState(() => _enabledNotifications.clear());
          }),
          builder: (context, state) => state.maybeWhen<Widget>(
            granted: () => _NotificationsTogglerList(
              notificationTypes: _toggableNotifications,
              enabledNotifications: _enabledNotifications.toList(),
              onToggled: _onNotificationToggled,
            ),
            pending: CenteredCircledIndicator.new,
            orElse: () => Stack(
              children: [
                _NotificationsTogglerList(
                  notificationTypes: _toggableNotifications,
                  enabledNotifications: _enabledNotifications.toList(),
                  onToggled: _onNotificationToggled,
                ),
                Positioned.fill(
                  child: ColoredBox(
                    color: AppTheme.getBaseColor(context).withOpacity(0.5),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: context
                        .read<NotificationPermissionCubit>()
                        .requestPermission,
                    child: const Text('Enable Notifications'),
                  ),
                )
              ],
            ),
            failed: (_) => Center(
              child: TextButton(
                onPressed: context
                    .read<NotificationPermissionCubit>()
                    .requestPermission,
                child: const Text('Enable Notifications'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onNotificationToggled(bool isEnabled, NotificationTypes notification) {
    setState(() {
      if (isEnabled) {
        _enabledNotifications.add(notification);
      } else {
        _enabledNotifications.remove(notification);
      }
    });
  }

  final List<NotificationTypes> _toggableNotifications = [
    ...NotificationTypes.values
  ]..remove(NotificationTypes.newFeatures);
}

class _NotificationsTogglerList extends StatelessWidget {
  const _NotificationsTogglerList({
    required this.notificationTypes,
    required this.onToggled,
    required this.enabledNotifications,
    Key? key,
  }) : super(key: key);

  final void Function(bool, NotificationTypes) onToggled;
  final List<NotificationTypes> notificationTypes, enabledNotifications;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: notificationTypes.length,
      itemBuilder: (context, index) {
        final notification = notificationTypes[index];
        return ListTile(
          key: ValueKey(notification),
          title: Text(_getNotificationLabel(notification)),
          subtitle: Text(
            _getNotificationDescription(notification),
            style: context.textTheme.caption!.apply(color: Colors.grey),
          ),
          trailing: CupertinoSwitch(
            activeColor: context.theme.primaryColor,
            value: enabledNotifications.contains(notification),
            onChanged: (enabled) => onToggled(
              enabled,
              notification,
            ),
          ),
        );
      },
      separatorBuilder: (context, _) => const Divider(),
    );
  }

  String _getNotificationLabel(NotificationTypes type) {
    assert(
      type != NotificationTypes.newFeatures,
      'Should be enabled by default',
    );
    return const {
      NotificationTypes.expenseAlert: 'Expense Alert',
      NotificationTypes.budget: 'Budget',
      NotificationTypes.tipsAndArticles: 'Tips and Articles',
    }[type]!;
  }

  String _getNotificationDescription(NotificationTypes type) {
    assert(
      type != NotificationTypes.newFeatures,
      'Should be enabled by default',
    );
    return const {
      NotificationTypes.expenseAlert: 'Get notifications about your expenses',
      NotificationTypes.budget: 'Get notified when you have exceeded your '
          'budget',
      NotificationTypes.tipsAndArticles: 'Small and useful pieces of practical '
          'financial tips',
    }[type]!;
  }
}
