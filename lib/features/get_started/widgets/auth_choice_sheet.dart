import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/primary_button.dart';

enum AuthChoice { login, register }

/// Get Started tap hone par jo bottom sheet khulti hai:
/// yahan se Login ya Register ka action trigger hota hai.
class AuthChoiceSheet extends StatelessWidget {
  const AuthChoiceSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSizes.xxl,
        AppSizes.m,
        AppSizes.xxl,
        AppSizes.xxl,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusXL),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.xl),
            Text('Let\'s get you in', style: AppTextStyles.h2),
            const SizedBox(height: AppSizes.xs),
            Text(
              'Sign in karein ya naya account banayein - dono sirf ek tap door.',
              style: AppTextStyles.bodyMuted,
            ),
            const SizedBox(height: AppSizes.xl),
            PrimaryButton(
              label: AppStrings.signIn,
              icon: Icons.login_rounded,
              onPressed: () => Navigator.of(context).pop(AuthChoice.login),
            ),
            const SizedBox(height: AppSizes.m),
            PrimaryButton(
              label: AppStrings.createAccount,
              light: true,
              icon: Icons.person_add_alt_1_rounded,
              onPressed: () => Navigator.of(context).pop(AuthChoice.register),
            ),
          ],
        ),
      ),
    );
  }
}
