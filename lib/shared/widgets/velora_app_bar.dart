import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'circle_icon_button.dart';

/// Reusable header: back button + centered title + optional actions.
class VeloraAppBar extends StatelessWidget {
  const VeloraAppBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.actions = const [],
    this.onBack,
    this.dark = false,
    this.titleStyle,
  });

  final String title;
  final bool showBack;
  final List<Widget> actions;
  final VoidCallback? onBack;
  final bool dark;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    final foreground = dark ? AppColors.white : AppColors.textPrimary;

    return Row(
      children: [
        SizedBox(
          width: AppSizes.iconButton,
          child: showBack
              ? CircleIconButton(
                  icon: Icons.arrow_back_rounded,
                  background: dark
                      ? AppColors.white.withOpacity(0.12)
                      : AppColors.surface,
                  foreground: foreground,
                  onTap: onBack ?? () => Navigator.of(context).maybePop(),
                )
              : null,
        ),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: (titleStyle ?? AppTextStyles.h3).copyWith(color: foreground),
          ),
        ),
        SizedBox(
          width: AppSizes.iconButton,
          child: actions.isEmpty
              ? null
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions,
                ),
        ),
      ],
    );
  }
}

/// Jab ek se zyada action chahiye ho to yeh version use karein.
class VeloraWideAppBar extends StatelessWidget {
  const VeloraWideAppBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.actions = const [],
  });

  final String title;
  final bool showBack;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showBack)
          CircleIconButton(
            icon: Icons.arrow_back_rounded,
            onTap: () => Navigator.of(context).maybePop(),
          ),
        if (showBack) const SizedBox(width: AppSizes.m),
        Expanded(child: Text(title, style: AppTextStyles.h2)),
        ...actions,
      ],
    );
  }
}
