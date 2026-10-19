import 'package:flutter/material.dart';

import '../../app/app_routes.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../shared/widgets/app_image.dart';
import '../../shared/widgets/fade_in_up.dart';
import '../../shared/widgets/page_dots.dart';
import '../../shared/widgets/primary_button.dart';
import 'widgets/auth_choice_sheet.dart';

/// Reference design ka hero screen - "Easy way to buy your dream car".
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  Future<void> _openAuthChoice(BuildContext context) async {
    final result = await showModalBottomSheet<AuthChoice>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const AuthChoiceSheet(),
    );

    if (result == null || !context.mounted) return;

    Navigator.of(context).pushNamed(
      result == AuthChoice.login ? AppRoutes.login : AppRoutes.register,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.l),
        child: SafeArea(
          child: FadeInUp(
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: AppColors.heroGradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(AppSizes.radiusXL),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 30,
                    offset: Offset(0, 16),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(AppSizes.xxl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSizes.xl),
                  Text(
                    AppStrings.heroTitle,
                    style: AppTextStyles.display.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: AppSizes.m),
                  Text(
                    AppStrings.heroSubtitle,
                    style: AppTextStyles.bodyMuted.copyWith(
                      color: AppColors.textOnDarkSoft,
                    ),
                  ),
                  const SizedBox(height: AppSizes.xl),
                  Expanded(
                    child: Center(
                      child: Hero(
                        tag: 'hero-car',
                        child: AppImage(
                          source: AppAssets.heroCar,
                          fit: BoxFit.contain,
                          placeholderColors: AppColors.heroGradient,
                          placeholderIconSize: 88,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.xl),
                  const Center(child: PageDots(count: 3, index: 0)),
                  const SizedBox(height: AppSizes.xl),
                  PrimaryButton(
                    label: AppStrings.getStarted,
                    light: true,
                    onPressed: () => _openAuthChoice(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
