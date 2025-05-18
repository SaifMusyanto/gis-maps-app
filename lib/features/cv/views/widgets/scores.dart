import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/core/styles.dart';
import 'package:gis_maps_app/features/cv/data/models/analysis/analysis_model.dart';
import 'package:gis_maps_app/features/cv/data/models/cv/cv_model.dart';
import 'package:gis_maps_app/features/cv/views/widgets/expandable_card.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:gis_maps_app/widgets/custom_paragraph.dart';
import 'package:gis_maps_app/widgets/custom_section.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class Scores extends StatefulWidget {
  final AnalysisModel analysis;

  const Scores({super.key, required this.analysis});

  @override
  State<Scores> createState() => _ScoresState();
}

class _ScoresState extends State<Scores> {
  @override
  Widget build(BuildContext context) {
    return Column(
          spacing: Styles.smPadding,
          children: [
    ExpandableCard(
      title: context.l10n.experience,
      icon: IconsaxPlusBold.briefcase,
      analysisAspect: widget.analysis.experiences,
    ),
    ExpandableCard(
      title: context.l10n.skill,
      icon: IconsaxPlusBold.flash_1,
      analysisAspect: widget.analysis.skills,
    ),
    ExpandableCard(
      title: context.l10n.education,
      icon: IconsaxPlusBold.teacher,
      analysisAspect: widget.analysis.education,
    ),
    ExpandableCard(
      title: context.l10n.format,
      icon: IconsaxPlusBold.designtools,
      analysisAspect: widget.analysis.formatting,
    ),
    ExpandableCard(
      title: context.l10n.atsFriendly,
      icon: IconsaxPlusBold.document_favorite,
      analysisAspect: widget.analysis.atsFriendly,
    )
          ],
        );
  }
}
