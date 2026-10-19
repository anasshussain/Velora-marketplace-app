import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../data/models/brand.dart';
import '../../../shared/widgets/brand_chip.dart';

class BrandSelector extends StatelessWidget {
  const BrandSelector({
    super.key,
    required this.brands,
    required this.selectedId,
    required this.onSelected,
  });

  final List<Brand> brands;
  final String? selectedId;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenPadding),
        itemCount: brands.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppSizes.xl),
        itemBuilder: (context, i) {
          final brand = brands[i];
          return BrandChip(
            brand: brand,
            selected: brand.id == selectedId,
            onTap: () => onSelected(brand.id),
          );
        },
      ),
    );
  }
}
