import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/styles.dart';

class CvFileItem extends StatelessWidget {
  final String? fileName;

  const CvFileItem({super.key, required this.fileName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary10.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary20),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: Styles.smPadding,
        horizontal: Styles.mdPadding,
      ),
      child: Row(
        children: [
          Icon(IconsaxPlusBold.document_upload, color: AppColors.primary50, size: 20),
          const SizedBox(width: Styles.smPadding),
          Expanded(
            child: Text(
              fileName ?? '-',
              style: Theme.of(context).textTheme.labelLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
