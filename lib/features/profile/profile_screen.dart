import 'package:flutter/material.dart';

import '../../app/app_routes.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/repositories/car_repository.dart';
import '../../shared/widgets/app_image.dart';
import '../../shared/widgets/circle_icon_button.dart';
import '../../shared/widgets/fade_in_up.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/settings_tile.dart';
import '../../shared/widgets/velora_app_bar.dart';
import 'widgets/function_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = CarRepository.profile;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(
            AppSizes.screenPadding,
            AppSizes.m,
            AppSizes.screenPadding,
            AppSizes.xxxl,
          ),
          child: FadeInUp(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                VeloraAppBar(
                  title: AppStrings.profile,
                  actions: [
                    CircleIconButton(
                      icon: Icons.edit_outlined,
                      border: true,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.xxl),
                Center(
                  child: Container(
                    width: 104,
                    height: 104,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 4),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.shadow,
                          blurRadius: 24,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Hero(
                        tag: 'profile-avatar',
                        child: AppImage(
                          source: profile.avatar,
                          placeholderIcon: Icons.person_rounded,
                          placeholderIconSize: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.l),
                Text(
                  profile.name,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h2,
                ),
                const SizedBox(height: 2),
                Text(
                  profile.subtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMuted,
                ),
                const SizedBox(height: AppSizes.xxl),
                Text(AppStrings.commonFunctions, style: AppTextStyles.h3),
                const SizedBox(height: AppSizes.m),
                Row(
                  children: const [
                    Expanded(
                      child: FunctionTile(
                        icon: Icons.build_outlined,
                        label: AppStrings.maintain,
                      ),
                    ),
                    SizedBox(width: AppSizes.m),
                    Expanded(
                      child: FunctionTile(
                        icon: Icons.settings_input_component_outlined,
                        label: AppStrings.autoParts,
                      ),
                    ),
                    SizedBox(width: AppSizes.m),
                    Expanded(
                      child: FunctionTile(
                        icon: Icons.emoji_events_outlined,
                        label: AppStrings.drivingSkill,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.xl),
                SettingsTile(
                  icon: Icons.directions_car_filled_outlined,
                  title: AppStrings.myCars,
                  trailing: const Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.textTertiary,
                  ),
                  onTap: () => Navigator.of(context).pushNamed(
                    AppRoutes.favorites,
                  ),
                ),
                const SizedBox(height: AppSizes.m),
                SettingsTile(
                  icon: Icons.share_outlined,
                  title: AppStrings.socialMediaLinks,
                  trailing: const Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.textTertiary,
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: AppSizes.xxxl),
                PrimaryButton(
                  label: AppStrings.logOut,
                  onPressed: () => Navigator.of(context)
                      .pushNamedAndRemoveUntil(
                    AppRoutes.getStarted,
                    (route) => false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
