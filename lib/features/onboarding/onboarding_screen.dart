import 'package:flutter/material.dart';

import '../../app/app_routes.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/onboarding_page_data.dart';
import '../../data/repositories/car_repository.dart';
import '../../shared/widgets/page_dots.dart';
import '../../shared/widgets/primary_button.dart';
import 'widgets/onboarding_page_view.dart';

/// 3-step onboarding jo Get Started screen par le jata hai.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _index = 0;

  List<OnboardingPageData> get _pages => CarRepository.onboarding;

  bool get _isLast => _index == _pages.length - 1;

  void _next() {
    if (_isLast) {
      _finish();
      return;
    }
    _controller.nextPage(
      duration: const Duration(milliseconds: 380),
      curve: Curves.easeOutCubic,
    );
  }

  void _finish() => Navigator.of(context).pushReplacementNamed(
        AppRoutes.getStarted,
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.screenPadding,
                  vertical: AppSizes.s,
                ),
                child: TextButton(
                  onPressed: _finish,
                  child: Text(
                    AppStrings.skip,
                    style: AppTextStyles.label.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (context, i) =>
                    OnboardingPageView(data: _pages[i]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.screenPadding,
                AppSizes.l,
                AppSizes.screenPadding,
                AppSizes.xxl,
              ),
              child: Column(
                children: [
                  PageDots(
                    count: _pages.length,
                    index: _index,
                    activeColor: AppColors.dark,
                    inactiveColor: AppColors.textTertiary,
                  ),
                  const SizedBox(height: AppSizes.xl),
                  PrimaryButton(
                    label: _isLast ? AppStrings.getStarted : AppStrings.next,
                    onPressed: _next,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
