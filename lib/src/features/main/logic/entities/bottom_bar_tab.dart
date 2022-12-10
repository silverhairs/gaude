import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

enum BottomBarTab {
  home,
  transactions,
  budget,
  profile;

  String get label {
    switch (this) {
      case BottomBarTab.home:
        return 'Home';
      case BottomBarTab.transactions:
        return 'Transactions';
      case BottomBarTab.budget:
        return 'Budget';
      case BottomBarTab.profile:
        return 'Profile';
    }
  }

  IconData get icon {
    switch (this) {
      case BottomBarTab.home:
        return Ionicons.grid;
      case BottomBarTab.transactions:
        return Ionicons.stats_chart;
      case BottomBarTab.budget:
        return Ionicons.wallet;
      case BottomBarTab.profile:
        return Ionicons.person;
    }
  }
}
