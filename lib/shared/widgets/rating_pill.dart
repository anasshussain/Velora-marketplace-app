import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class RatingPill extends StatelessWidget {
  const RatingPill({
    super.key,
    required this.rating,
    this.reviews,
    this.compact = true,
    this.color,
  });

  final double rating;
  final int? reviews;
  final bool compact;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final textColor = color ?? AppColors.textSecondary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star_rounded, size: 14, color: AppColors.star),
        const SizedBox(width: 3),
        Text(
          compact ? rating.toStringAsFixed(1) : '($rating)',
          style: AppTextStyles.caption.copyWith(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (reviews != null) ...[
          const SizedBox(width: 4),
          Text(
            '($reviews reviews)',
            style: AppTextStyles.caption.copyWith(color: textColor),
          ),
        ],
      ],
    );
  }
}
