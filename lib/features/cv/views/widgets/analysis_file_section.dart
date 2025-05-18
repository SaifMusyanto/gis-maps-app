import 'package:flutter/material.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/core/styles.dart';
import 'package:gis_maps_app/features/cv/data/models/cv/cv_model.dart';
import 'package:gis_maps_app/features/cv/views/widgets/cv_file_item.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:gis_maps_app/widgets/custom_paragraph.dart';
import 'package:gis_maps_app/widgets/custom_section.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../database/constants.dart';

class AnalysisFileSection extends StatefulWidget {
  final CvModel cv;

  const AnalysisFileSection({super.key, required this.cv});

  @override
  State<AnalysisFileSection> createState() => _AnalysisFileSectionState();
}

class _AnalysisFileSectionState extends State<AnalysisFileSection> {
  String _cvPurpose = '-';
  String _descriptionLabel = '';
  bool _isShowMore = false;

  void _initData() {
    switch (widget.cv.purpose) {
      case CvPurpose.career:
        _cvPurpose = context.l10n.career;
        _descriptionLabel = context.l10n.careerDescription;
        break;
      case CvPurpose.scholarship:
        _cvPurpose = context.l10n.scholarship;
        _descriptionLabel = context.l10n.scholarshipDescription;
        break;
      case CvPurpose.organization:
        _cvPurpose = context.l10n.organization;
        _descriptionLabel = context.l10n.organizationDescription;
        break;
      case null:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_cvPurpose == '-') {
      _initData();
    }

    return CustomSection(
      icon: IconsaxPlusBold.document_text,
      title: context.l10n.file,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CvFileItem(fileName: widget.cv.fileName),
          const SizedBox(height: Styles.xxsSpacing),
          Text(
            '${context.l10n.uploadedAt} ${widget.cv.createdAt == null ? "" : Constants.dateFormat.format(widget.cv.createdAt!)}',
            style: context.textTheme.labelLarge?.copyWith(
              color: AppColors.grey50,
            ),
          ),
          const SizedBox(height: Styles.mdSpacing),
          Row(
            spacing: Styles.smSpacing,
            children: [
              Expanded(child: CustomParagraph(
                title: context.l10n.cvPurpose,
                content: Text(
                  _cvPurpose,
                  style: context.textTheme.labelLarge,
                ),
              )),
              if (widget.cv.purpose == CvPurpose.career && widget.cv.position != null) Expanded(child: CustomParagraph(
                title: context.l10n.careerPosition,
                content: Text(
                  widget.cv.position ?? '-',
                  style: context.textTheme.labelLarge,
                ),
              )),
            ],
          ),
          if (widget.cv.description != null) const SizedBox(height: Styles.smSpacing),
          if (widget.cv.description != null) CustomParagraph(
            title: _descriptionLabel,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Styles.xxsSpacing,
              children: [
                Text(
                  widget.cv.description!,
                  maxLines: _isShowMore ? null : 2,
                  overflow: _isShowMore ? null : TextOverflow.ellipsis,
                  style: context.textTheme.labelLarge,
                ),

                // if text is more than 2 lines, show see more
                if (widget.cv.description!.length > 100) GestureDetector(
                  onTap: () {
                    setState(() {
                      _isShowMore = !_isShowMore;
                    });
                  },
                  child: Text(
                    _isShowMore ? context.l10n.hide : context.l10n.seeMore,
                    style: context.textTheme.labelLarge?.copyWith(
                      color: AppColors.primary50,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
