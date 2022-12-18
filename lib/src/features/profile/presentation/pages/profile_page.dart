import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
        orElse: () => const _ProfileErrorView(),
        loaded: (account) => _ProfileView(account: account),
        loading: () => const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView({required this.account, Key? key}) : super(key: key);

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
            child: _ProfilePageHeader(account: account),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            // constraints: BoxConstraints(
            //   maxHeight: context.screenSize.height / 2,
            // ),
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
                    key: const ValueKey('account-profile-key'),
                    onTap: () {
                      // TODO: Implement me
                    },
                    title: 'Account',
                    icon: Ionicons.wallet_outline,
                  ),
                  ProfileListTile(
                    key: const ValueKey('settings-profile-key'),
                    onTap: () {
                      // TODO: Implement me
                    },
                    title: 'Settings',
                    icon: Ionicons.settings_outline,
                  ),
                  ProfileListTile(
                    key: const ValueKey('data-profile-key'),
                    onTap: () {
                      //TODO: Implement me
                    },
                    title: 'Export Data',
                    icon: Ionicons.document_attach_outline,
                  ),
                  ProfileListTile(
                    onTap: () => _onLogout(context),
                    title: 'Logout',
                    icon: Ionicons.log_out_outline,
                    color: AppColors.red,
                  )
                ],
              ),
            ),
          ),
          // const Expanded(child: ColoredBox(color: AppColors.red40))
        ],
      ),
    );
  }

  void _onLogout(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to log out ?'),
        actions: [
          CupertinoButton(
            onPressed: () {
              context.read<AuthenticationBloc>().add(
                    const AuthenticationLogout(),
                  );

              Navigator.of(context).pop();
            },
            child: Text(
              'Yes, logout',
              style: context.textTheme.button!.copyWith(color: AppColors.red),
            ),
          ),
          CupertinoButton(
            onPressed: Navigator.of(context).pop,
            child: Text(
              'Cancel',
              style: context.textTheme.button!.copyWith(
                color: AppTheme.getSolidTextColor(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfilePageHeader extends StatelessWidget {
  const _ProfilePageHeader({Key? key, required this.account}) : super(key: key);

  final Account account;

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
                radius: kMinInteractiveDimension,
                backgroundImage: CachedNetworkImageProvider(
                  account.photoUrl,
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
                  account.name,
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

class _ProfileErrorView extends StatelessWidget {
  const _ProfileErrorView();

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
