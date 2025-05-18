import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gis_maps_app/features/cv/views/widgets/cv_history_section.dart';
import 'package:gis_maps_app/features/cv/views/widgets/cv_upload_section.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:gis_maps_app/widgets/custom_page.dart';

import '../../../injector/injector.dart';
import 'bloc/cv_bloc.dart';

@RoutePage()
class CvPage extends StatefulWidget {
  const CvPage({super.key});

  @override
  State<CvPage> createState() => _CvPageState();
}

class _CvPageState extends State<CvPage> {
  final _bloc = Injector.instance<CvBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc..add(CvEvent.getHistory()),
      child: CustomPage(
        title: context.l10n.hireka,
        isBackDisabled: true,
        sections: [
          CvUploadSection(),
          CvHistorySection(),
        ],
      ),
    );
  }
}