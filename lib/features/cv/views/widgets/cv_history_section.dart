import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gis_maps_app/core/styles.dart';
import 'package:gis_maps_app/features/cv/data/models/cv/cv_model.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:gis_maps_app/routes/router.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:hive/hive.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../../../../database/constants.dart';
import '../../../../injector/injector.dart';
import 'package:sizer/sizer.dart';
import '../../../../widgets/custom_section.dart';
import '../bloc/cv_bloc.dart';


class CvHistorySection extends StatefulWidget {
  const CvHistorySection({super.key});

  @override
  State<StatefulWidget> createState() => _CvHistorySectionState();
}

class _CvHistorySectionState extends State<CvHistorySection> {
  final _bloc = Injector.instance<CvBloc>();
  List<CvModel> _historyList = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc..add(CvEvent.getHistory()),
      child: BlocBuilder<CvBloc, CvState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (history) {
              _historyList = history;
              return CustomSection(
                title: context.l10n.history,
                icon: IconsaxPlusBold.refresh_left_square,
                description: context.l10n.historyDescription,
                hasSpacing: _historyList.isNotEmpty,
                child: _historyList.isEmpty
                    ? _buildEmpty()
                    : ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _historyList.length,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: Styles.mdSpacing);
                  },
                  itemBuilder: (context, index) {
                    return _buildCvCard(_historyList[index], index);
                  },
                ),
              );
            },
            loading: () {
              return CustomSection(
                title: context.l10n.history,
                icon: IconsaxPlusBold.refresh_left_square,
                description: context.l10n.historyDescription,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: Styles.mdSpacing);
                  },
                  itemBuilder: (context, index) {
                    return _buildCvCard(generateDummyCvModel(), index);
                  },
                ),
              );
            },
            orElse: () {return SizedBox.shrink();},
          );
        },
      ),
    );
  }

  Widget _buildCvCard(CvModel cv, int index) {
    String purpose = '';
    IconData purposeIcon = IconsaxPlusBold.info_circle;
    switch (cv.purpose) {
      case CvPurpose.career:
        purpose = context.l10n.career;
        purposeIcon = IconsaxPlusBold.briefcase;
        break;
      case CvPurpose.scholarship:
        purpose = context.l10n.scholarship;
        purposeIcon = IconsaxPlusBold.teacher;
        break;
      case CvPurpose.organization:
        purpose = context.l10n.organization;
        purposeIcon = IconsaxPlusBold.people;
        break;
      case null:
        break;
    }

    return GestureDetector(
      onTap: () {
        context.router.push(AnalysisResultRoute(cv: cv, isSaved: true));
      },
      child: Container( // List datanya
        padding: const EdgeInsets.symmetric(horizontal: Styles.mdPadding, vertical: Styles.smPadding),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.grey10),
          borderRadius: BorderRadius.circular(Styles.lgRadius),
        ),
        child: Column(
          spacing: Styles.xsSpacing,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: Styles.xxsPadding,
                      horizontal: Styles.smPadding),
                  decoration: BoxDecoration(
                    color: AppColors.primary10,
                    borderRadius: BorderRadius.circular(
                        Styles.lgRadius),
                  ),
                  child: Row(
                    spacing: Styles.xxsSpacing,
                    children: [
                      Icon(
                        purposeIcon,
                        size: Styles.smIcon,
                        color: AppColors.primary50,
                      ),
                      Text(
                        purpose,
                        style: context.textTheme.labelSmall
                            ?.copyWith(color: AppColors.primary70,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Row(
                    children: [
                      Text(
                        '${context.l10n.score}: ',
                        style: context.textTheme.labelLarge
                            ?.copyWith(color: AppColors.grey90,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "${cv.overallScore ?? 0}%",
                        style: context.textTheme.labelLarge
                            ?.copyWith(color: getScoreColor(
                            cv.overallScore ?? 0),
                            fontWeight: FontWeight.w600),
                      ),
                    ]
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cv.fileName ?? '-',
                  style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.grey90,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  cv.createdAt != null ? Constants.dateFormat
                      .format(cv.createdAt!) : '-',
                  style: context.textTheme.labelLarge?.copyWith(
                      color: AppColors.grey50,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ]
        ),
      )
    );
  }

  Widget _buildEmpty() {
    return Padding(
      padding: const EdgeInsets.only(bottom: Styles.mdPadding),
      child: Center(
        child: Column(
          spacing: Styles.xsSpacing,
          children: [
            Image.asset(
              'assets/core/img_empty.png',
              width: 36.w,
              fit: BoxFit.cover,
            ),
            Text(
              context.l10n.emptyData,
              style: context.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Color getScoreColor(int skor) {
    if (skor > 66) {
      return AppColors.success50;
    } else if (skor < 33) {
      return AppColors.danger50;
    } else {
      return AppColors.warning50;
    }
  }
}