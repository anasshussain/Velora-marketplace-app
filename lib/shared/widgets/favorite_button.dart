import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/app_haptics.dart';
import '../../state/favorites_controller.dart';

/// Animated heart toggle - global favorites state se bound.
class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.carId,
    this.size = 34,
    this.iconSize = 18,
    this.background = AppColors.surface,
    this.inactiveColor = AppColors.textSecondary,
  });

  final String carId;
  final double size;
  final double iconSize;
  final Color background;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<String>>(
      valueListenable: FavoritesController.instance,
      builder: (context, favorites, _) {
        final active = favorites.contains(carId);
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            AppHaptics.light();
            FavoritesController.instance.toggle(carId);
          },
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: background,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Icon(
                active ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                key: ValueKey<bool>(active),
                size: iconSize,
                color: active ? AppColors.danger : inactiveColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
