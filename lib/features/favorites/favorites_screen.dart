import 'package:flutter/material.dart';

import '../../app/app_routes.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/car.dart';
import '../../shared/widgets/car_list_tile.dart';
import '../../shared/widgets/circle_icon_button.dart';
import '../../shared/widgets/fade_in_up.dart';
import '../../shared/widgets/velora_app_bar.dart';
import '../../state/favorites_controller.dart';

/// Saved cars ki list - global favorites state se live bound.
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, this.showBackButton = false});

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.screenPadding,
                AppSizes.m,
                AppSizes.screenPadding,
                AppSizes.l,
              ),
              child: VeloraAppBar(
                title: AppStrings.favoriteCar,
                showBack: showBackButton,
                actions: [
                  CircleIconButton(
                    icon: Icons.search_rounded,
                    border: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<Set<String>>(
                valueListenable: FavoritesController.instance,
                builder: (context, _, __) {
                  final cars = FavoritesController.instance.favorites;
                  if (cars.isEmpty) return const _EmptyFavorites();
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(
                      AppSizes.screenPadding,
                      0,
                      AppSizes.screenPadding,
                      AppSizes.navBarHeight + AppSizes.xxxl,
                    ),
                    itemCount: cars.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: AppSizes.m),
                    itemBuilder: (context, i) {
                      final Car car = cars[i];
                      return FadeInUp(
                        delay: Duration(milliseconds: 50 * i),
                        child: CarListTile(
                          car: car,
                          onTap: () => Navigator.of(context).pushNamed(
                            AppRoutes.carDetails,
                            arguments: car,
                          ),
                          onBuy: () => Navigator.of(context).pushNamed(
                            AppRoutes.carDetails,
                            arguments: car,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyFavorites extends StatelessWidget {
  const _EmptyFavorites();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.xxxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.favorite_border_rounded,
              size: 44,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: AppSizes.m),
            Text(AppStrings.emptyFavorites, style: AppTextStyles.title),
            const SizedBox(height: AppSizes.xs),
            Text(
              AppStrings.emptyFavoritesSub,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMuted,
            ),
          ],
        ),
      ),
    );
  }
}
