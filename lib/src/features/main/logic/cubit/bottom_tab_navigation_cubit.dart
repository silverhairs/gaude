import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaude/src/features/main/logic/entities/bottom_bar_tab.dart';

part 'bottom_tab_navigation_cubit.freezed.dart';
part 'bottom_tab_navigation_state.dart';

class BottomTabNavigationCubit extends Cubit<BottomTabNavigationState> {
  BottomTabNavigationCubit() : super(const BottomTabNavigationState.opened());

  void openTab(BottomBarTab tab) {
    if (tab == state.tab) {
      emit(state.copyWith(hits: state.hits + 1));
    } else {
      emit(BottomTabNavigationState.opened(tab: tab));
    }
  }

  void openTabByIndex(int index) {
    final tab = BottomBarTab.values[index];
    openTab(tab);
  }
}
