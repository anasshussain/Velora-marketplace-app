import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/setting_option.dart';
import '../../data/repositories/car_repository.dart';
import '../../shared/widgets/fade_in_up.dart';
import '../../shared/widgets/settings_tile.dart';
import '../../shared/widgets/velora_app_bar.dart';
import '../../state/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, this.showBackButton = false});

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    final options = CarRepository.settings;

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
                title: AppStrings.settings,
                showBack: showBackButton,
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<Map<String, bool>>(
                valueListenable: SettingsController.instance,
                builder: (context, toggles, _) {
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(
                      AppSizes.screenPadding,
                      0,
                      AppSizes.screenPadding,
                      AppSizes.navBarHeight + AppSizes.xxxl,
                    ),
                    itemCount: options.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: AppSizes.m),
                    itemBuilder: (context, i) {
                      final SettingOption option = options[i];
                      return FadeInUp(
                        delay: Duration(milliseconds: 40 * i),
                        child: SettingsTile(
                          icon: option.icon,
                          title: option.title,
                          onTap: option.isToggle
                              ? () => SettingsController.instance.toggle(
                                    option.id,
                                    !(toggles[option.id] ?? false),
                                  )
                              : () {},
                          trailing: option.isToggle
                              ? Transform.scale(
                                  scale: 0.82,
                                  child: Switch(
                                    value: toggles[option.id] ?? false,
                                    onChanged: (value) => SettingsController
                                        .instance
                                        .toggle(option.id, value),
                                  ),
                                )
                              : const Icon(
                                  Icons.chevron_right_rounded,
                                  color: AppColors.textTertiary,
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
