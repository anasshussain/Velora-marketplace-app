import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/car.dart';
import 'app_image.dart';
import 'primary_button.dart';

/// Favorites list ka horizontal card.
class CarListTile extends StatelessWidget {
  const CarListTile({
    super.key,
    required this.car,
    this.onTap,
    this.onBuy,
    this.trailing,
  });

  final Car car;
  final VoidCallback? onTap;
  final VoidCallback? onBuy;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppSizes.radiusL),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(AppSizes.m),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusL),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 18,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.radiusS),
                child: SizedBox(
                  width: 96,
                  height: 72,
                  child: Hero(
                    tag: 'car-image-fav-${car.id}',
                    child: AppImage(source: car.image),
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.m),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      car.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.title,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Price: ${car.price}',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 13,
                          color: AppColors.star,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${car.rating}  (${car.reviews} reviews)',
                          style: AppTextStyles.caption,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.s),
                    PrimaryButton(
                      label: AppStrings.buyNow,
                      expanded: false,
                      height: 30,
                      radius: AppSizes.radiusS,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.l,
                      ),
                      onPressed: onBuy,
                    ),
                  ],
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: AppSizes.s),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
