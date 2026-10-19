import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/app_haptics.dart';

class AppNavItem {
  const AppNavItem({required this.icon, required this.activeIcon, required this.label});

  final IconData icon;
  final IconData activeIcon;
  final String label;
}

/// Floating dark pill navigation bar.
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.index,
    required this.onChanged,
    required this.items,
  });

  final int index;
  final ValueChanged<int> onChanged;
  final List<AppNavItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.navBarHeight,
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(AppSizes.radiusPill),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.22),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.s),
      child: Row(
        children: List.generate(items.length, (i) {
          final item = items[i];
          final active = i == index;
          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                AppHaptics.selection();
                onChanged(i);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 240),
                    curve: Curves.easeOut,
                    padding: const EdgeInsets.all(AppSizes.s),
                    decoration: BoxDecoration(
                      color: active
                          ? AppColors.white.withOpacity(0.14)
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      active ? item.activeIcon : item.icon,
                      size: 21,
                      color: active
                          ? AppColors.white
                          : AppColors.white.withOpacity(0.45),
                    ),
                  ),
                  const SizedBox(height: 3),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 240),
                    height: 3,
                    width: active ? 14 : 0,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
