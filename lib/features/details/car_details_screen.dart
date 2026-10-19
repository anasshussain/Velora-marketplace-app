import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/car.dart';
import '../../shared/widgets/app_image.dart';
import '../../shared/widgets/circle_icon_button.dart';
import '../../shared/widgets/fade_in_up.dart';
import '../../shared/widgets/favorite_button.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/rating_pill.dart';
import '../../shared/widgets/spec_card.dart';

/// Car details - dark hero + white detail sheet.
class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key, required this.car});

  final Car car;

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  bool _expanded = false;

  Car get car => widget.car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Column(
        children: [
          Expanded(flex: 5, child: _Hero(car: car)),
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppSizes.radiusXL),
                ),
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(
                          AppSizes.xl,
                          AppSizes.xl,
                          AppSizes.xl,
                          AppSizes.m,
                        ),
                        child: FadeInUp(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      car.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.h2,
                                    ),
                                  ),
                                  RatingPill(
                                    rating: car.rating,
                                    compact: false,
                                    color: AppColors.textPrimary,
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppSizes.s),
                              _Description(
                                text: car.description,
                                expanded: _expanded,
                                onToggle: () =>
                                    setState(() => _expanded = !_expanded),
                              ),
                              const SizedBox(height: AppSizes.xl),
                              Text(
                                AppStrings.features,
                                style: AppTextStyles.h3,
                              ),
                              const SizedBox(height: AppSizes.m),
                              Row(
                                children: [
                                  Expanded(
                                    child: SpecCard(
                                      icon: Icons.event_seat_outlined,
                                      label: AppStrings.totalCapacity,
                                      value: car.seats,
                                    ),
                                  ),
                                  const SizedBox(width: AppSizes.m),
                                  Expanded(
                                    child: SpecCard(
                                      icon: Icons.speed_rounded,
                                      label: AppStrings.highestSpeed,
                                      value: car.topSpeed,
                                    ),
                                  ),
                                  const SizedBox(width: AppSizes.m),
                                  Expanded(
                                    child: SpecCard(
                                      icon: Icons.bolt_rounded,
                                      label: AppStrings.engineOutput,
                                      value: car.power,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        AppSizes.xl,
                        AppSizes.s,
                        AppSizes.xl,
                        AppSizes.xl,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(AppStrings.price, style: AppTextStyles.caption),
                              const SizedBox(height: 2),
                              Text(car.price, style: AppTextStyles.price),
                            ],
                          ),
                          const SizedBox(width: AppSizes.xl),
                          Expanded(
                            child: PrimaryButton(
                              label: AppStrings.buyNow,
                              height: 50,
                              onPressed: () => _showPurchaseSheet(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPurchaseSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        padding: const EdgeInsets.all(AppSizes.xxl),
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
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  color: AppColors.surfaceAlt,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: AppColors.success,
                  size: 28,
                ),
              ),
              const SizedBox(height: AppSizes.l),
              Text('Request received', style: AppTextStyles.h2),
              const SizedBox(height: AppSizes.xs),
              Text(
                'Hamari team ${car.name} ke liye jaldi aapse contact karegi.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMuted,
              ),
              const SizedBox(height: AppSizes.xl),
              PrimaryButton(
                label: 'Done',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero({required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.heroGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: AppSizes.xl),
          child: Hero(
            tag: 'car-image-${car.id}',
            child: AppImage(
              source: car.image,
              fit: BoxFit.contain,
              placeholderColors: AppColors.heroGradient,
              placeholderIconSize: 80,
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.xl,
              vertical: AppSizes.s,
            ),
            child: Row(
              children: [
                CircleIconButton(
                  icon: Icons.arrow_back_rounded,
                  background: AppColors.white.withValues(alpha: 0.14),
                  foreground: AppColors.white,
                  onTap: () => Navigator.of(context).maybePop(),
                ),
                Expanded(
                  child: Text(
                    AppStrings.carDetails,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h3.copyWith(color: AppColors.white),
                  ),
                ),
                FavoriteButton(
                  carId: car.id,
                  size: AppSizes.iconButton,
                  iconSize: 20,
                  background: AppColors.white.withValues(alpha: 0.14),
                  inactiveColor: AppColors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    required this.text,
    required this.expanded,
    required this.onToggle,
  });

  final String text;
  final bool expanded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onToggle,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 220),
        alignment: Alignment.topCenter,
        child: RichText(
          maxLines: expanded ? null : 2,
          overflow: expanded ? TextOverflow.clip : TextOverflow.ellipsis,
          text: TextSpan(
            text: '$text ',
            style: AppTextStyles.bodyMuted,
            children: [
              TextSpan(
                text: expanded ? AppStrings.less : '...${AppStrings.more}',
                style: AppTextStyles.bodyMuted.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
