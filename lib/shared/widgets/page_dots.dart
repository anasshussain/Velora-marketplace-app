import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Animated page indicator.
class PageDots extends StatelessWidget {
  const PageDots({
    super.key,
    required this.count,
    required this.index,
    this.activeColor = AppColors.white,
    this.inactiveColor = AppColors.textTertiary,
  });

  final int count;
  final int index;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (i) {
        final active = i == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 260),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          height: 6,
          width: active ? 20 : 6,
          decoration: BoxDecoration(
            color: active ? activeColor : inactiveColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(100),
          ),
        );
      }),
    );
  }
}
