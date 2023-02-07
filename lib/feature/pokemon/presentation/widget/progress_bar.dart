import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_pokedex/shared/app_colors.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    this.color = AppColors.lightGreen,
    this.backgroundColor = AppColors.lighterGrey,
    required this.progress,
  });

  final Color backgroundColor;
  final Color color;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 5.0,
      alignment: Alignment.centerLeft,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColors.lighterGrey,
      ),
      child: Container(
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: color.withAlpha(200),
        ),
      ).animate().slide(
            delay: const Duration(milliseconds: 500),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            begin: const Offset(-1.0, 0.0),
            end: Offset(-1.0 + progress, 0.0),
          ),
    );
  }
}
