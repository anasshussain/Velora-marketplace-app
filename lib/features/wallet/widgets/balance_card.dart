import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/payment_card.dart';

/// Gradient credit card.
class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key, required this.card});

  final PaymentCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.xl),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.walletGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
        boxShadow: [
          BoxShadow(
            color: AppColors.walletGradient.first.withOpacity(0.35),
            blurRadius: 26,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            card.label,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.white.withOpacity(0.72),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                card.balance,
                style: AppTextStyles.h1.copyWith(color: AppColors.white),
              ),
              Text(
                card.network.toUpperCase(),
                style: AppTextStyles.title.copyWith(
                  color: AppColors.white,
                  letterSpacing: 1.5,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            card.maskedNumber,
            style: AppTextStyles.title.copyWith(
              color: AppColors.white,
              letterSpacing: 2,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              _CardMeta(label: AppStrings.expDate, value: card.expiry),
              const SizedBox(width: AppSizes.xxl),
              _CardMeta(label: AppStrings.cvcNumber, value: card.cvc),
            ],
          ),
        ],
      ),
    );
  }
}

class _CardMeta extends StatelessWidget {
  const _CardMeta({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.white.withOpacity(0.65),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: AppTextStyles.label.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
