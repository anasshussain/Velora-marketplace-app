import 'package:flutter/material.dart';

import '../../../app/app_routes.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/user_profile.dart';
import '../../../shared/widgets/app_image.dart';
import '../../../shared/widgets/circle_icon_button.dart';

/// Welcome + avatar + notification bell.
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.profile),
          child: Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.border, width: 2),
            ),
            child: ClipOval(
              child: Hero(
                tag: 'profile-avatar',
                child: AppImage(
                  source: profile.avatar,
                  placeholderIcon: Icons.person_rounded,
                  placeholderIconSize: 22,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSizes.m),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${AppStrings.welcome} 👋',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                profile.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.h3,
              ),
            ],
          ),
        ),
        CircleIconButton(
          icon: Icons.notifications_none_rounded,
          border: true,
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.notifications),
        ),
      ],
    );
  }
}
