import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gis_maps_app/features/cv/views/widgets/cv_file_item.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:gis_maps_app/widgets/custom_button.dart';
import 'package:gis_maps_app/widgets/custom_dashed_border.dart';
import 'package:gis_maps_app/widgets/custom_section.dart';
import 'package:gis_maps_app/core/styles.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:gis_maps_app/l10n/l10n.dart';

class UploadCvSection extends StatelessWidget {
  final VoidCallback onPickPdfFile;
  final String? uploadedFileName;
  final String? uploadedFilePath;

  /// File eksternal (misalnya preload dari backend/local)
  final String? externalFileName;
  final String? externalFilePath;

  const UploadCvSection({
    super.key,
    required this.onPickPdfFile,
    this.uploadedFileName,
    this.uploadedFilePath,
    this.externalFileName,
    this.externalFilePath,
  });

  @override
  Widget build(BuildContext context) {
    // Prioritaskan file dari upload, fallback ke external jika tidak ada
    final String? activeFileName = uploadedFileName ?? externalFileName;
    final String? activeFilePath = uploadedFilePath ?? externalFilePath;

    final bool isUploaded = activeFileName != null && activeFilePath != null;

    return CustomSection(
      icon: IconsaxPlusBold.document_text,
      title: context.l10n.uploadYourCv,
      description: 'Unggah file CV kamu untuk dianalisis.',
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        crossFadeState:
            isUploaded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        firstChild: GestureDetector(
          onTap: onPickPdfFile,
          child: CustomPaint(
            painter: DashedBorderPainter(
              color: AppColors.grey30.withOpacity(0.5),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(IconsaxPlusBold.document_upload,
                        color: AppColors.primary50, size: 24),
                    const SizedBox(height: Styles.xsPadding),
                    Text(
                      context.l10n.uploadFile,
                      style: context.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary50,
                      ),
                    ),
                    const SizedBox(height: Styles.xxsPadding),
                    Text(
                      context.l10n.maksPdf,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.primary50.withOpacity(0.7),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        secondChild: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CvFileItem(fileName: activeFileName),
            const SizedBox(height: Styles.smPadding),
            CustomButton(
              buttonText: context.l10n.changeFile,
              isOutlinedButton: true,
              onPressed: onPickPdfFile,
            )
          ],
        ),
      ),
    );
  }
}
