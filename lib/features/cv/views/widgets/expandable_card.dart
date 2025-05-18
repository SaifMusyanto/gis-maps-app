import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/core/styles.dart';
import 'package:gis_maps_app/features/cv/data/models/analysis_aspect/analysis_aspect_model.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:gis_maps_app/widgets/custom_paragraph.dart';
import 'package:gis_maps_app/widgets/custom_section.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../analysis_result_page.dart';

class ExpandableCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnalysisAspectModel analysisAspect;

  const ExpandableCard({
    super.key,
    required this.title,
    required this.icon,
    required this.analysisAspect,
  });

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      icon: widget.icon,
      title: widget.title,
      trailing: InkWell(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${context.l10n.score}: ', style: context.textTheme.bodySmall),
            Text(
              '${widget.analysisAspect.score ?? 0}%',
              style: context.textTheme.bodySmall?.copyWith(
                color: _getScoreColor(widget.analysisAspect.score ?? 0),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: Styles.xsSpacing),
            Icon(
              _isExpanded
                  ? IconsaxPlusBold.arrow_up_1
                  : IconsaxPlusBold.arrow_down,
              size: 20,
              color: AppColors.grey50,
            ),
          ],
        ),
      ),
      hasSpacing: false,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        alignment: Alignment.topLeft,
        curve: Curves.easeInOut,
        child: !_isExpanded ? SizedBox.shrink() : Column(
          children: [
            SizedBox(height: Styles.mdSpacing),

            // Analysis section
            CustomParagraph(
                title: context.l10n.analysis,
                content: RichText(
                  text: TextSpan(
                    style: context.textTheme.labelLarge,
                    children: parseBoldText(context, widget.analysisAspect.analysis),
                  ),
                )
            ),
            SizedBox(height: Styles.smPadding),

            // Recommendations section
            if (widget.analysisAspect.improvements.isNotEmpty)
              CustomParagraph(
                title: context.l10n.recommendation,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.analysisAspect.improvements!
                      .map<Widget>((improvement) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('• ',
                          style: context.textTheme.labelLarge),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: context.textTheme.labelLarge,
                            children: parseBoldText(context, improvement),
                          ),
                        ),
                      ),
                    ],
                  ))
                      .toList(),
                ),
              ),
            if (widget.analysisAspect.improvements.isNotEmpty)
              SizedBox(height: Styles.smPadding),

            // Corrections section
            if (widget.analysisAspect.corrections.isNotEmpty)
              CustomParagraph(
                title: context.l10n.correction,
                content: Container(
                  decoration: BoxDecoration(
                    border:
                    Border.all(color: AppColors.primary10, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: Styles.xsPadding,
                          horizontal: Styles.smPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.analysisAspect.corrections
                              .map<Widget>((correction) => Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text('• ',
                                  style: context
                                      .textTheme.labelLarge),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: context.textTheme.labelLarge,
                                    children: parseBoldText(context, correction),
                                  ),
                                ),
                              ),
                            ],
                          ))
                              .toList(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: Styles.xsPadding,
                          horizontal: Styles.smPadding,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary10,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(12),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            final dataToCopy = widget.analysisAspect.corrections
                                .map((correction) => '• $correction')
                                .join('\n');
                            Clipboard.setData(
                                ClipboardData(text: dataToCopy));
                            context.showSnackBar(message: context.l10n.copiedToClipboard);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(IconsaxPlusBold.copy, color: AppColors.primary50, size: 16),
                              SizedBox(width: Styles.xxsSpacing),
                              Text(
                                context.l10n.copyCorrection,
                                style: context.textTheme.labelLarge
                                    ?.copyWith(
                                  color: AppColors.primary50,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.primary50,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getScoreColor(int score) {
    if (score < 1 / 3 * 100) return AppColors.danger50;
    if (score < 2 / 3 * 100) return AppColors.warning50;
    return AppColors.success50;
  }
}