import 'package:flutter/material.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/util/extensions.dart';

import '../core/styles.dart';

class CustomSection extends StatelessWidget {
  const CustomSection(
      {super.key,
      required this.icon,
      required this.title,
      this.trailing,
      this.description,
      this.child,
      this.hasSpacing = true});

  final IconData icon;
  final String title;
  final Widget? trailing;
  final String? description;
  final Widget? child;
  final bool hasSpacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Styles.mdPadding,
        horizontal: Styles.xlPadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: Styles.defaultShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.white),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.primary50,
                  size: Styles.mdIcon,
                ),
                SizedBox(width: Styles.smSpacing),
                Expanded(
                  child: Text(
                    title,
                    style: context.textTheme.titleSmall,
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
          ),
          if (description != null && description!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: Styles.xxsSpacing),
              child: Text(
                description!,
                style: context.textTheme.labelLarge?.copyWith(
                  color: AppColors.grey50,
                ),
              ),
            ),
          if (child != null)
            Container(
              padding: EdgeInsets.only(top: hasSpacing ? Styles.mdSpacing : 0),
              child: child!,
            ),
        ],
      ),
    );
  }
}
