import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/circle_icon_button.dart';
import '../../splash/widgets/velora_logo.dart';
import '../../../core/theme/app_colors.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleIconButton(
              icon: Icons.arrow_back_rounded,
              onTap: () => Navigator.of(context).maybePop(),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(AppSizes.s),
              decoration: const BoxDecoration(
                color: AppColors.dark,
                shape: BoxShape.circle,
              ),
              child: const VeloraLogo(size: 26),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.xxl),
        Text(title, style: AppTextStyles.display),
        const SizedBox(height: AppSizes.s),
        Text(subtitle, style: AppTextStyles.bodyMuted),
      ],
    );
  }
}
