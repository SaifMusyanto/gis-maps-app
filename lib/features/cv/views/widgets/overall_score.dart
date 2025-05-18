import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/core/styles.dart';
import 'package:gis_maps_app/features/cv/data/models/analysis/analysis_model.dart';
import 'package:gis_maps_app/features/cv/data/models/cv/cv_model.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../analysis_result_page.dart';

class OverallScore extends StatefulWidget {
  final CvModel cv;

  const OverallScore({super.key, required this.cv});

  @override
  State<OverallScore> createState() => _OverallScoreState();
}

class _OverallScoreState extends State<OverallScore> {
  List<AnalysisScore> _chartData = [];
  final List<AnalysisScore> _backgroundChart = [
    AnalysisScore(100, 'backgroundChart'),
  ];

  @override
  void initState() {
    super.initState();

    _initData();
  }

  void _initData() {
    _chartData = [
      AnalysisScore(widget.cv.overallScore ?? 0, 'Overall Score'),
      AnalysisScore(100 - (widget.cv.overallScore ?? 0), 'dummy'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 140,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SfCircularChart(
                margin: EdgeInsets.zero,
                series: <CircularSeries>[
                  DoughnutSeries<AnalysisScore, String>(
                    dataSource: _backgroundChart,
                    xValueMapper: (AnalysisScore data, _) => data.name,
                    yValueMapper: (AnalysisScore data, _) => data.score,
                    pointColorMapper: (AnalysisScore data, _) {
                      return AppColors.grey10;
                    },
                    innerRadius: '76%',
                    radius: '70',
                    animationDuration: 0,
                  ),
                ],
              ),
              SfCircularChart(
                margin: EdgeInsets.zero,
                series: <CircularSeries>[
                  DoughnutSeries<AnalysisScore, String>(
                    dataSource: _chartData,
                    xValueMapper: (AnalysisScore data, _) => data.name,
                    yValueMapper: (AnalysisScore data, _) => data.score,
                    pointColorMapper: (AnalysisScore data, _) {
                      if (data.name == 'Overall Score') {
                        if (data.score >= 2 / 3 * 100) {
                          return AppColors.success50;
                        } else if (data.score >= 1 / 3 * 100) {
                          return AppColors.warning50;
                        } else {
                          return AppColors.danger50;
                        }
                      } else {
                        return AppColors.grey10;
                      }
                    },
                    innerRadius: '76%',
                    cornerStyle: CornerStyle.bothCurve,
                    radius: '70',
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.l10n.score,
                    style: context.textTheme.bodyLarge,
                  ),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: (widget.cv.overallScore ?? 0).toDouble()),
                    duration: const Duration(milliseconds: 1200),
                    builder: (context, value, _) => Text(
                      '${value.toInt()}%',
                      style: context.textTheme.headlineLarge?.copyWith(
                        color: value >= 2 / 3 * 100
                            ? AppColors.success50
                            : value >= 1 / 3 * 100
                                ? AppColors.warning50
                                : AppColors.danger50,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: Styles.lgSpacing),
        Text(
          context.l10n.overview,
          style: context.textTheme.labelLarge
              ?.copyWith(fontWeight: FontWeight.w800),
        ),
        SizedBox(height: Styles.xxsSpacing),
        RichText(
          text: TextSpan(
            style: context.textTheme.labelLarge,
            children: parseBoldText(context, widget.cv.analysis?.overview ?? ''),
          ),
        ),
        SizedBox(height: Styles.smPadding),
        Text(context.l10n.keywordRecommendation,
            style: context.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w800,
            )),
        SizedBox(height: Styles.xsSpacing),
        if (widget.cv.analysis?.recommendedKeywords != null )Wrap(
          spacing: Styles.smSpacing,
          runSpacing: Styles.xsSpacing,
          children: widget.cv.analysis!.recommendedKeywords
              .map((e) => buildCustomChip(context, e))
              .toList(),
        ),
      ],
    );
  }
}

class AnalysisScore {
  AnalysisScore(this.score, this.name);
  final String name;
  final int score;
}

Widget buildCustomChip(BuildContext context, String label) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: Styles.smPadding, vertical: Styles.xxsPadding),
    decoration: BoxDecoration(
      color: AppColors.primary10,
      borderRadius: BorderRadius.circular(100),
    ),
    child: Text(
      label,
      style: context.textTheme.labelLarge
          ?.copyWith(color: AppColors.primary70, fontWeight: FontWeight.w600),
    ),
  );
}