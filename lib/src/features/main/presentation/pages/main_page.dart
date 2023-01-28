import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:ionicons/ionicons.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.pages});

  final Map<BottomBarTab, Widget> pages;

  static const String floatingActionButtonKey = 'main_page_fab';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  late final Map<BottomBarTab, GlobalKey<NavigatorState>> _navigatorKeys;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _navigatorKeys = widget.pages.map(
      (tab, page) => MapEntry(
        tab,
        GlobalKey<NavigatorState>(debugLabel: tab.label),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    _unlockApp();
    if (state == AppLifecycleState.resumed) {
      context.read<NotificationPermissionCubit>().getPermissionStatus();
      // _unlockApp();
    }
  }

  @override
  void dispose() {
    for (var i = 0; i < _navigatorKeys.length; i++) {
      final tab = _navigatorKeys.keys.elementAt(i);
      _navigatorKeys.remove(tab)?.currentState?.dispose();
    }
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        AccountUpdateFailureListener(),
        AppLockListener(),
      ],
      child: BlocConsumer<BottomTabNavigationCubit, BottomTabNavigationState>(
        listenWhen: _activeTabIsTappedMoreThanOnce,
        listener: _navigateBackToFirstRouteOfAciveTab,
        builder: (context, state) => state.when(
          opened: (tab, _) => WillPopScope(
            onWillPop: () async {
              if (_navigatorKeys[tab]!.currentState!.canPop()) {
                _navigatorKeys[tab]!.currentState!.pop();
                return false;
              }
              return true;
            },
            child: Scaffold(
              body: CustomIndexedStack(
                index: widget.pages.keys.toList().indexOf(tab),
                children: [...widget.pages.map(_wrapWithNavigator).values],
              ),
              bottomNavigationBar: BottomAppBar(
                elevation: 4,
                child: Row(
                  children: [
                    ...widget.pages.keys
                        .toList()
                        .sublist(0, (widget.pages.length ~/ 2))
                        .map(
                          (tab) => Expanded(
                            key: ValueKey(tab),
                            child: _buildTabButton(
                              tab: tab,
                              state: state,
                              context: context,
                            ),
                          ),
                        ),
                    const Expanded(child: SizedBox()),
                    ...widget.pages.keys
                        .toList()
                        .sublist(widget.pages.length ~/ 2)
                        .map(
                          (tab) => Expanded(
                            key: ValueKey(tab),
                            child: _buildTabButton(
                              tab: tab,
                              state: state,
                              context: context,
                            ),
                          ),
                        ),
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.violet20,
                  shape: BoxShape.circle,
                ),
                child: FloatingActionButton(
                  key: const ValueKey(MainPage.floatingActionButtonKey),
                  backgroundColor: AppColors.violet,
                  onPressed: () {
                    // TODO: Implement me.
                    throw UnimplementedError('Add new expense button pressed');
                  },
                  child: const Icon(Ionicons.add, color: AppColors.light),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _unlockApp() {
    if (Platform.isIOS) return;
    final appSettings = context.read<AppSettingsCubit>();
    appSettings.state.whenOrNull(loaded: (settings) {
      if (settings.onboardingStatus == OnboardingStatus.completed) {
        context.read<AppLockCubit>().authenticate();
      }
    });
  }

  bool _activeTabIsTappedMoreThanOnce(
    BottomTabNavigationState previousState,
    BottomTabNavigationState currentState,
  ) {
    return previousState.tab == currentState.tab && currentState.hits > 1;
  }

  void _navigateBackToFirstRouteOfAciveTab(
    BuildContext context,
    BottomTabNavigationState state,
  ) {
    if (state.hits > 1) {
      _navigatorKeys[state.tab]!
          .currentState
          ?.popUntil((route) => route.isFirst);
    }
  }

  Widget _buildTabButton({
    required BottomBarTab tab,
    required BottomTabNavigationState state,
    required BuildContext context,
  }) {
    final width = context.screenSize.width / 5;
    return InkWell(
      splashColor: AppColors.violet20,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(Dimens.radiusButton),
      ),
      onTap: () => context.read<BottomTabNavigationCubit>().openTab(tab),
      child: SizedBox(
        width: width,
        height: kBottomNavigationBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            state.tab == tab
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 4,
                    constraints: BoxConstraints(
                      minHeight: 4,
                      minWidth: 24,
                      maxWidth: width > 24 ? width - 8 : width - 2,
                    ),
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  )
                : const SizedBox(height: 4),
            Expanded(
              child: Icon(
                tab.icon,
                color: state.tab == tab ? AppColors.dark40 : AppColors.dark20,
                size: 24,
              ),
            ),
            Text(
              tab.label,
              style: context.textTheme.bodySmall!.copyWith(
                color: state.tab == tab ? AppColors.dark40 : AppColors.dark20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  MapEntry<BottomBarTab, Widget> _wrapWithNavigator(
    BottomBarTab tab,
    Widget child,
  ) =>
      MapEntry(
        tab,
        Navigator(
          key: _navigatorKeys[tab]!,
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => child,
            );
          },
        ),
      );
}
