import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.source,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
    this.width,
    this.height,
    this.placeholderIcon = Icons.directions_car_filled_rounded,
    this.placeholderIconSize = 34,
    this.placeholderColors = AppColors.placeholderGradient,
  });

  final String source;
  final BoxFit fit;
  final Alignment alignment;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;
  final IconData placeholderIcon;
  final double placeholderIconSize;
  final List<Color> placeholderColors;

  bool get _isNetwork => source.startsWith('http');

  @override
  Widget build(BuildContext context) {
    final placeholder = _Placeholder(
      icon: placeholderIcon,
      iconSize: placeholderIconSize,
      colors: placeholderColors,
    );

    if (source.isEmpty) return placeholder;

    final Widget image = _isNetwork
        ? Image.network(
      source,
      fit: fit,
      alignment: alignment,
      width: width,
      height: height,
      gaplessPlayback: true,
      errorBuilder: (_, __, ___) => placeholder,
      loadingBuilder: (context, child, progress) =>
      progress == null ? child : placeholder,
    )
        : Image.asset(
      source,
      fit: fit,
      alignment: alignment,
      width: width,
      height: height,
      gaplessPlayback: true,
      errorBuilder: (_, __, ___) => placeholder,
      frameBuilder: (context, child, frame, wasSyncLoaded) {
        if (wasSyncLoaded) return child;
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          child: child,
        );
      },
    );

    if (padding == EdgeInsets.zero) return image;
    return Padding(padding: padding, child: image);
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({
    required this.icon,
    required this.iconSize,
    required this.colors,
  });

  final IconData icon;
  final double iconSize;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          size: iconSize,
          color: AppColors.textSecondary.withValues(alpha: 0.55),
        ),
      ),
    );
  }
}