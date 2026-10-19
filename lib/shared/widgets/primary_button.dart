import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/app_haptics.dart';

/// App ka main CTA button (dark ya light variant).
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.expanded = true,
    this.light = false,
    this.icon,
    this.height = AppSizes.buttonHeight,
    this.radius = AppSizes.radiusPill,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSizes.xxl),
  });

  final String label;
  final VoidCallback? onPressed;
  final bool expanded;
  final bool light;
  final IconData? icon;
  final double height;
  final double radius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final background = light ? AppColors.white : AppColors.dark;
    final foreground = light ? AppColors.textPrimary : AppColors.white;
    final enabled = onPressed != null;

    final button = Opacity(
      opacity: enabled ? 1 : 0.5,
      child: Material(
        color: background,
        borderRadius: BorderRadius.circular(radius),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: enabled
              ? () {
                  AppHaptics.light();
                  onPressed!();
                }
              : null,
          child: Container(
            height: height,
            padding: padding,
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 18, color: foreground),
                  const SizedBox(width: AppSizes.s),
                ],
                Flexible(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.button.copyWith(color: foreground),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return expanded ? SizedBox(width: double.infinity, child: button) : button;
  }
}
