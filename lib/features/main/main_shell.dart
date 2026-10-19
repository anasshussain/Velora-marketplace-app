import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../shared/widgets/app_bottom_nav.dart';
import '../../state/navigation_controller.dart';
import '../favorites/favorites_screen.dart';
import '../home/home_screen.dart';
import '../settings/settings_screen.dart';
import '../wallet/wallet_screen.dart';

/// Bottom navigation ka container - state preserve rehta hai.
class MainShell extends StatelessWidget {
  const MainShell({super.key});

  static const List<AppNavItem> _items = [
    AppNavItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
      label: 'Home',
    ),
    AppNavItem(
      icon: Icons.favorite_border_rounded,
      activeIcon: Icons.favorite_rounded,
      label: 'Favorites',
    ),
    AppNavItem(
      icon: Icons.account_balance_wallet_outlined,
      activeIcon: Icons.account_balance_wallet_rounded,
      label: 'Wallet',
    ),
    AppNavItem(
      icon: Icons.settings_outlined,
      activeIcon: Icons.settings_rounded,
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: NavigationController.instance,
      builder: (context, index, _) {
        return Scaffold(
          extendBody: true,
          body: Stack(
            children: [
              IndexedStack(
                index: index,
                children: const [
                  HomeScreen(),
                  FavoritesScreen(),
                  WalletScreen(),
                  SettingsScreen(),
                ],
              ),
              Positioned(
                left: AppSizes.screenPadding,
                right: AppSizes.screenPadding,
                bottom: AppSizes.l + MediaQuery.of(context).padding.bottom * 0.4,
                child: AppBottomNav(
                  index: index,
                  items: _items,
                  onChanged: NavigationController.instance.select,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
