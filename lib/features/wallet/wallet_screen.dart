import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/repositories/car_repository.dart';
import '../../shared/widgets/circle_icon_button.dart';
import '../../shared/widgets/fade_in_up.dart';
import '../../shared/widgets/velora_app_bar.dart';
import 'widgets/balance_card.dart';
import 'widgets/transaction_tile.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key, this.showBackButton = false});

  final bool showBackButton;

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final PageController _cardController =
      PageController(viewportFraction: 0.92);

  @override
  void dispose() {
    _cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cards = CarRepository.paymentCards;
    final history = CarRepository.transactions;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            SliverToBoxAdapter(
              child: FadeInUp(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSizes.screenPadding,
                    AppSizes.m,
                    AppSizes.screenPadding,
                    AppSizes.l,
                  ),
                  child: Column(
                    children: [
                      VeloraAppBar(
                        title: AppStrings.wallet,
                        showBack: widget.showBackButton,
                      ),
                      const SizedBox(height: AppSizes.xl),
                      Text(
                        AppStrings.availableBalance,
                        style: AppTextStyles.label,
                      ),
                      const SizedBox(height: AppSizes.xs),
                      Text(
                        CarRepository.profile.balance,
                        style: AppTextStyles.display.copyWith(fontSize: 34),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSizes.screenPadding,
                  AppSizes.s,
                  AppSizes.screenPadding,
                  AppSizes.m,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppStrings.cards, style: AppTextStyles.h3),
                    CircleIconButton(
                      icon: Icons.add_rounded,
                      size: 32,
                      iconSize: 18,
                      border: true,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: FadeInUp(
                delay: const Duration(milliseconds: 80),
                child: SizedBox(
                  height: 196,
                  child: PageView.builder(
                    controller: _cardController,
                    itemCount: cards.length,
                    padEnds: false,
                    itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.only(
                        left: AppSizes.screenPadding,
                        right: AppSizes.s,
                      ),
                      child: BalanceCard(card: cards[i]),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSizes.screenPadding,
                  AppSizes.xl,
                  AppSizes.screenPadding,
                  AppSizes.m,
                ),
                child: Text(AppStrings.history, style: AppTextStyles.h3),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.screenPadding,
                0,
                AppSizes.screenPadding,
                AppSizes.navBarHeight + AppSizes.xxxl,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSizes.m),
                    child: FadeInUp(
                      delay: Duration(milliseconds: 50 * i),
                      child: TransactionTile(item: history[i]),
                    ),
                  ),
                  childCount: history.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
