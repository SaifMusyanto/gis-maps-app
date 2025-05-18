import 'package:flutter/material.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../core/app_colors.dart';
import '../core/styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.label, required this.onTap});

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: Styles.xxsSpacing,
        children: [
          Text(
            label,
            style: context.textTheme.labelLarge?.copyWith(
              color: AppColors.primary50,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary50,
            ),
          ),
          Icon(
            IconsaxPlusBold.arrow_right_3,
            color: AppColors.primary50,
            size: Styles.mdIcon,
          ),
        ],
      ),
    );
  }
}
