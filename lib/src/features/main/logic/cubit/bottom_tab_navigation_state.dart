part of 'bottom_tab_navigation_cubit.dart';

@freezed
class BottomTabNavigationState with _$BottomTabNavigationState {
  const factory BottomTabNavigationState.opened({
    @Default(BottomBarTab.home) BottomBarTab tab,
    @Default(1) int hits,
  }) = _Opened;
}
