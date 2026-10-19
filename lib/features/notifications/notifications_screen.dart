import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/app_notification.dart';
import '../../data/repositories/car_repository.dart';
import '../../shared/widgets/fade_in_up.dart';
import '../../shared/widgets/velora_app_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = CarRepository.notifications;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(
                AppSizes.screenPadding,
                AppSizes.m,
                AppSizes.screenPadding,
                AppSizes.l,
              ),
              child: VeloraAppBar(title: AppStrings.notifications),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(
                  AppSizes.screenPadding,
                  0,
                  AppSizes.screenPadding,
                  AppSizes.xxxl,
                ),
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: AppSizes.m),
                itemBuilder: (context, i) => FadeInUp(
                  delay: Duration(milliseconds: 45 * i),
                  child: _NotificationTile(item: items[i]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({required this.item});

  final AppNotification item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.l),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 14,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.dark,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: AppSizes.s),
              Text(item.meta, style: AppTextStyles.caption),
            ],
          ),
          const SizedBox(height: AppSizes.s),
          Text(
            item.message,
            style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
