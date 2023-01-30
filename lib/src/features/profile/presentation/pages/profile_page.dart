import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:ionicons/ionicons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) => state.maybeWhen(
        orElse: () => const ProfileErrorView(),
        loaded: _ProfileView.new,
        loading: () => const CenteredCircledIndicator(),
      ),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView(this.account, {Key? key}) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.outerPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: kToolbarHeight),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Dimens.largePadding,
            ),
            child: _ProfilePageHeader(user: account.user),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.symmetric(
              vertical: Dimens.outerPadding,
            ),
            decoration: BoxDecoration(
              color: AppTheme.getBaseColor(context),
              borderRadius: BorderRadius.circular(Dimens.radiusMedium),
            ),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: _ProfileTilesList(
                children: [
                  ProfileListTile(
                    key: ProfilePageKeys.accountCallToActionKey,
                    onTap: () {
                      // TODO: Implement me
                    },
                    title: 'Account',
                    icon: Ionicons.wallet_outline,
                  ),
                  ProfileListTile(
                    key: ProfilePageKeys.settingsCallToActionKey,
                    onTap: () => context.navigateTo(const SettingsPage()),
                    title: 'Settings',
                    icon: Ionicons.settings_outline,
                  ),
                  ProfileListTile(
                    key: ProfilePageKeys.exportDataCallToActionKey,
                    onTap: () {
                      //TODO: Implement me
                    },
                    title: 'Export Data',
                    icon: Ionicons.document_attach_outline,
                  ),
                  ProfileListTile(
                    key: ProfilePageKeys.logoutCallToActionKey,
                    onTap: () => _onLogout(context),
                    title: 'Logout',
                    icon: Ionicons.log_out_outline,
                    color: AppColors.red,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onLogout(BuildContext context) {
    context.useRoot(
      (rootContext) => showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: rootContext,
        builder: (context) => BottomSheet(
          enableDrag: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(Dimens.outerPadding),
              right: Radius.circular(Dimens.outerPadding),
            ),
          ),
          constraints: const BoxConstraints(
            maxHeight: 140,
          ),
          onClosing: Navigator.of(context).pop,
          builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.outerPadding,
              vertical: Dimens.innerPadding,
            ),
            child: Column(
              children: [
                Container(
                  height: 4,
                  constraints: const BoxConstraints(
                    maxWidth: kMinInteractiveDimension,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.radiusButton),
                    color: AppColors.blue20,
                  ),
                ),
                const SizedBox(height: Dimens.innerPadding),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Dimens.innerPadding,
                  ),
                  child: Text(
                    'Logout',
                    style: context.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(const AuthenticationLogout());
                        Navigator.of(context).pop();
                      },
                      child: const Text('Yes'),
                    ),
                    const SizedBox(width: Dimens.outerPadding),
                    TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: const Text('No'),
                    ),
                  ].map(
                    (child) {
                      if (child is ButtonStyleButton) {
                        return Expanded(
                          key: child.key,
                          child: child,
                        );
                      }
                      return child;
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfilePageHeader extends StatelessWidget {
  const _ProfilePageHeader({Key? key, required this.user}) : super(key: key);

  final AccountUser user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              constraints: BoxConstraints.loose(const Size(132, 132)),
              padding: const EdgeInsets.all(Dimens.innerPadding / 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.getBackgroundColor(context),
                border: Border.fromBorderSide(
                  BorderSide(color: AppTheme.primarySwatch, width: 2),
                ),
              ),
              child: CircleAvatar(
                key: ProfilePageKeys.profileImageKey,
                radius: kMinInteractiveDimension,
                backgroundImage: CachedNetworkImageProvider(
                  user.photoUrl,
                ),
              ),
            ),
            const SizedBox(width: Dimens.outerPadding),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: Colors.grey),
                ),
                Text(
                  user.name,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
        IconButton(
          onPressed: () {
            // TODO: Implement me
          },
          icon: const Icon(Ionicons.pencil_sharp),
        )
      ],
    );
  }
}

class _ProfileTilesList extends StatelessWidget {
  const _ProfileTilesList({required this.children, Key? key}) : super(key: key);

  final List<ProfileListTile> children;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: children.length,
      itemBuilder: (context, index) {
        return children[index];
      },
    );
  }
}

@visibleForTesting
class ProfilePageKeys {
  static const profileImageKey = ValueKey('profile-page-user-image-key');
  static const accountCallToActionKey = ValueKey('profile-page-account-key');
  static const settingsCallToActionKey = ValueKey('profile-page-settings-key');
  static const exportDataCallToActionKey = ValueKey('profile-page-export-key');
  static const logoutCallToActionKey = ValueKey('profile-page-logout-key');

  static List<ValueKey> get all => const [
        profileImageKey,
        accountCallToActionKey,
        settingsCallToActionKey,
        exportDataCallToActionKey,
        logoutCallToActionKey,
      ];
}
