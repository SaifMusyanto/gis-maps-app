import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:gis_maps_app/widgets/custom_page.dart';
import 'package:gis_maps_app/widgets/custom_paragraph.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sizer/sizer.dart';

@RoutePage()
class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPage(title: context.l10n.aboutApp, sections: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: AppColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 16),
                  Image.asset(
                    'assets/core/img_hireka.png',
                    width: 8.w,
                  ),
                  SizedBox(width: 8),
                  Text(
                    context.l10n.hireka,
                    style: context.textTheme.headlineMedium,
                  ),
                ],
              ),
              SizedBox(height: 4),
              CustomParagraph(
                title: '',
                content: Text(context.l10n.appDescription,
                    style: context.textTheme.bodySmall),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.l10n.mainFeature,
                      style: context.textTheme.titleLarge),
                  SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(IconsaxPlusBold.tick_circle,
                              size: 20, color: AppColors.success50),
                          SizedBox(width: 8),
                          Expanded(
                              child: CustomParagraph(
                            title: context.l10n.cvEvaluationAndAssessment,
                            titleStyle: context.textTheme.titleSmall,
                            content: Text(
                                context.l10n.cvEvaluationAndAssessmentContent,
                              style: context.textTheme.bodySmall),
                          )),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(IconsaxPlusBold.tick_circle,
                              size: 20, color: AppColors.success50),
                          SizedBox(width: 8),
                          Expanded(
                              child: CustomParagraph(
                            title: context.l10n.cvImprovementRecommendations,
                            titleStyle: context.textTheme.titleSmall,
                            content: Text(context
                                .l10n.cvImprovementRecommendationsContent,
                              style: context.textTheme.bodySmall,),
                          ))
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(IconsaxPlusBold.tick_circle,
                              size: 20, color: AppColors.success50),
                          SizedBox(width: 8),
                          Expanded(
                              child: CustomParagraph(
                            title: context.l10n.jobInterviewSimulation,
                            titleStyle: context.textTheme.titleSmall,
                            content: Text(
                              context.l10n.jobInterviewSimulationContent,
                              style: context.textTheme.bodySmall,
                            ),
                          ))
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                context.l10n.aboutAppConclusion,
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
