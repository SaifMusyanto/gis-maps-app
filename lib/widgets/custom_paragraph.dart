import 'package:flutter/material.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/util/extensions.dart';

import '../core/styles.dart';

class CustomParagraph extends StatelessWidget {
  const CustomParagraph({
    super.key,
    required this.title,
    required this.content,
    this.titleStyle
  });

  final String title;
  final Widget content;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: titleStyle ?? context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold, color: AppColors.grey90)),
        SizedBox(
          height: Styles.xxsPadding,
        ),
        content,
      ],
    );
  }
}
