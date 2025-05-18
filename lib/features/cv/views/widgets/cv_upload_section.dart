import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gis_maps_app/core/styles.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:gis_maps_app/routes/router.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../widgets/custom_section.dart';

class CvUploadSection extends StatefulWidget {
  const CvUploadSection({super.key});

  @override
  State<StatefulWidget> createState() => _CvUploadSectionState();
}

class _CvUploadSectionState extends State<CvUploadSection> {
  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: context.l10n.cvAnalysis,
      icon: IconsaxPlusBold.document_text,
      description: context.l10n.cvAnalysisDescription,
      child: GestureDetector(
        onTap: () async {
          context.router.push(CvUploadRoute());
        },
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              border: Border.all(color: AppColors.primary50),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    IconsaxPlusBold.document_upload,
                    color: AppColors.white,
                  ),
                  SizedBox(width: Styles.mdSpacing),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.uploadcv,
                          style: context.textTheme.bodySmall?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          context.l10n.bestVersionofYourself,
                          style: context.textTheme.labelLarge?.copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: Styles.mdSpacing),
                  Icon(
                    IconsaxPlusBold.arrow_right_3,
                    color: AppColors.white,
                  ),
                ])),
      ),
    );
  }
}
