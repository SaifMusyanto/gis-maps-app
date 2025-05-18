import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gis_maps_app/features/cv/data/models/cv/cv_model.dart';
import 'package:gis_maps_app/features/cv/views/bloc/cv_bloc.dart';
import 'package:gis_maps_app/features/cv/views/widgets/more.dart';
import 'package:gis_maps_app/features/cv/views/widgets/analysis_file_section.dart';
import 'package:gis_maps_app/features/cv/views/widgets/overall_score.dart';
import 'package:gis_maps_app/features/cv/views/widgets/scores.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:gis_maps_app/routes/router.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:gis_maps_app/widgets/custom_button.dart';
import 'package:gis_maps_app/widgets/custom_page.dart';
import 'package:gis_maps_app/widgets/custom_section.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../injector/injector.dart';
import '../../../widgets/custom_alert_dialog.dart';

@RoutePage()
class AnalysisResultPage extends StatefulWidget {
  final CvModel cv;
  final bool isSaved;

  const AnalysisResultPage({super.key, required this.cv, this.isSaved = false});

  @override
  State<AnalysisResultPage> createState() => _AnalysisResultPageState();
}

class _AnalysisResultPageState extends State<AnalysisResultPage> {
  final _bloc = Injector.instance<CvBloc>();
  late bool _isSaved;

  @override
  void initState() {
    super.initState();

    _isSaved = widget.isSaved;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CvBloc, CvState>(
      bloc: _bloc,
      listener: (context, state) {
        state.maybeWhen(
          loading: () {
            context.loaderOverlay.show();
          },
          added: () {
            context.loaderOverlay.hide();
            context.showSnackBar(
                message: context.l10n.saveAnalysisSuccess
            );
            setState(() {
              _isSaved = true;
            });
            _bloc.add(CvEvent.getHistory());
          },
          error: (message) {
            context.loaderOverlay.hide();
            context.showSnackBar(
              message: message,
              isSuccess: false,
            );
          },
          orElse: () {
            context.loaderOverlay.hide();
          },
        );
      },
      child: CustomPage(
        title: context.l10n.analysisResult,
        sections: [
          AnalysisFileSection(cv: widget.cv),
          if (widget.cv.analysis != null) CustomSection(
              icon: IconsaxPlusBold.star_1,
              title: context.l10n.review,
              child: OverallScore(cv: widget.cv)),
          if (widget.cv.analysis != null) Scores(
              analysis: widget.cv.analysis!),
        ],
        trailing: _isSaved ? More(cv: widget.cv) : null,
        onBackPressed: () {
          if (_isSaved) {
            Navigator.of(context).pop();
          } else {
            showDialog(context: context, builder: (context) {
              return CustomAlertDialog(
                title: context.l10n.unsavedConfirmation,
                description: context.l10n.unsavedDesc,
                cancelText: context.l10n.leave,
                cancelAction: () {
                  Navigator.of(context).pop();
                },
                proceedText: context.l10n.save,
                proceedAction: () {
                  _bloc.add(CvEvent.addHistory(widget.cv));
                  Navigator.of(context).pop();
                },
              );
            });
          }
        },
        bottom: _isSaved ? null : CustomButton(
          buttonText: context.l10n.saveAnalysis,
          onPressed: () {
            _bloc.add(CvEvent.addHistory(widget.cv));
          },
        ),
      ),
    );
  }
}

List<TextSpan> parseBoldText(BuildContext context, String text) {
  final RegExp pattern = RegExp(r'\*(.*?)\*');
  final List<TextSpan> spans = [];
  int start = 0;

  for (final match in pattern.allMatches(text)) {
    if (match.start > start) {
      spans.add(TextSpan(text: text.substring(start, match.start)));
    }
    spans.add(
      TextSpan(
        text: match.group(1),
        style:
        context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w800),
      ),
    );
    start = match.end;
  }

  if (start < text.length) {
    spans.add(TextSpan(text: text.substring(start)));
  }

  return spans;
}
