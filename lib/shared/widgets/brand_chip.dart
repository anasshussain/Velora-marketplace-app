import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/brand.dart';
import 'app_image.dart';

/// Home screen ke brand selector chips.
class BrandChip extends StatelessWidget {
  const BrandChip({
    super.key,
    required this.brand,
    required this.selected,
    this.onTap,
  });

  final Brand brand;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: selected ? AppColors.dark : AppColors.surface,
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? AppColors.dark : AppColors.border,
              ),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 16,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            padding: const EdgeInsets.all(AppSizes.m),
            child: ClipOval(
              child: AppImage(
                source: brand.logo,
                fit: BoxFit.contain,
                placeholderIcon: Icons.workspace_premium_outlined,
                placeholderIconSize: 18,
                placeholderColors: selected
                    ? const [AppColors.dark, AppColors.darkSoft]
                    : AppColors.placeholderGradient,
              ),
            ),
          ),
          const SizedBox(height: AppSizes.s),
          Text(
            brand.name,
            style: AppTextStyles.label.copyWith(
              color: selected ? AppColors.textPrimary : AppColors.textSecondary,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
