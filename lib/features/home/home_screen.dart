import 'package:flutter/material.dart';

import '../../app/app_routes.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/car.dart';
import '../../data/repositories/car_repository.dart';
import '../../shared/widgets/car_grid_card.dart';
import '../../shared/widgets/fade_in_up.dart';
import '../../shared/widgets/search_field.dart';
import '../../shared/widgets/section_header.dart';
import '../../state/navigation_controller.dart';
import 'widgets/brand_selector.dart';
import 'widgets/home_header.dart';

/// Dashboard - search, brands aur popular cars grid.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  String? _brandId;

  List<Car> get _cars {
    var result = CarRepository.search(_query);
    if (_brandId != null) {
      final brandName = CarRepository.brands
          .firstWhere((b) => b.id == _brandId)
          .name
          .toLowerCase();
      result = result
          .where((c) => c.brand.toLowerCase() == brandName)
          .toList(growable: false);
    }
    return result;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openDetails(Car car) => Navigator.of(context).pushNamed(
        AppRoutes.carDetails,
        arguments: car,
      );

  @override
  Widget build(BuildContext context) {
    final cars = _cars;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.screenPadding,
                AppSizes.m,
                AppSizes.screenPadding,
                AppSizes.l,
              ),
              sliver: SliverToBoxAdapter(
                child: FadeInUp(
                  child: Column(
                    children: [
                      HomeHeader(profile: CarRepository.profile),
                      const SizedBox(height: AppSizes.xl),
                      SearchField(
                        hint: AppStrings.searchHint,
                        controller: _searchController,
                        onChanged: (value) => setState(() => _query = value),
                        onFilterTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: FadeInUp(
                delay: const Duration(milliseconds: 90),
                child: BrandSelector(
                  brands: CarRepository.brands,
                  selectedId: _brandId,
                  onSelected: (id) => setState(
                    () => _brandId = _brandId == id ? null : id,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.screenPadding,
                AppSizes.s,
                AppSizes.screenPadding,
                AppSizes.m,
              ),
              sliver: SliverToBoxAdapter(
                child: SectionHeader(
                  title: AppStrings.popularCar,
                  actionLabel: AppStrings.viewAll,
                  onAction: () => NavigationController.instance.select(1),
                ),
              ),
            ),
            if (cars.isEmpty)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: _EmptyResults(),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  AppSizes.screenPadding,
                  0,
                  AppSizes.screenPadding,
                  AppSizes.navBarHeight + AppSizes.xxxl,
                ),
                sliver: SliverGrid(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: AppSizes.l,
                    crossAxisSpacing: AppSizes.l,
                    childAspectRatio: 0.82,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      final car = cars[i];
                      return FadeInUp(
                        delay: Duration(milliseconds: 60 * i),
                        child: CarGridCard(
                          car: car,
                          onTap: () => _openDetails(car),
                        ),
                      );
                    },
                    childCount: cars.length,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _EmptyResults extends StatelessWidget {
  const _EmptyResults();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.xxxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.search_off_rounded,
              size: 42,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: AppSizes.m),
            Text(
              'Koi car nahi mili',
              style: AppTextStyles.title,
            ),
            const SizedBox(height: AppSizes.xs),
            Text(
              'Doosre keywords ya brand try karein.',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMuted,
            ),
          ],
        ),
      ),
    );
  }
}
