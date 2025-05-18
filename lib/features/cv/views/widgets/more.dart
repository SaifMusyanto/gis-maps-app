import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/features/cv/data/models/cv/cv_model.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:gis_maps_app/routes/router.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:gis_maps_app/widgets/custom_alert_dialog.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../core/styles.dart';
import '../../../../injector/injector.dart';
import '../bloc/cv_bloc.dart';

class More extends StatefulWidget {
  final CvModel cv;

  const More({super.key, required this.cv});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  final _bloc = Injector.instance<CvBloc>();

  void _showMoreOptions(BuildContext context, Offset offset) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (menuContext) =>
          Stack(
            children: [
              Positioned(
                right: Styles.lgPadding,
                top: offset.dy - Styles.xlPadding,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () async {
                      await showDialog(context: context, builder: (dialogContext) {
                        return BlocListener<CvBloc, CvState>(
                          bloc: _bloc,
                          listener: (context, state) async {
                            state.maybeWhen(
                              deleted: () async {
                                Navigator.of(context, rootNavigator: true).pop();

                                context.showSnackBar(
                                  message: context.l10n.historyDeleted,
                                  isSuccess: true,
                                );

                                _bloc.add(CvEvent.getHistory());

                                context.router.replace(DashboardRoute());
                              },
                              error: (message) {
                                context.showSnackBar(
                                  message: message,
                                  isSuccess: false,
                                );
                              },
                              orElse: () {},
                            );
                          },
                          child: CustomAlertDialog(
                            title: context.l10n.deleteHistory,
                            description: widget.cv.fileName ?? '-',
                            cancelText: context.l10n.cancel,
                            isDanger: true,
                            proceedText: context.l10n.delete,
                            proceedAction: () {
                              _bloc.add(CvEvent.deleteHistory(widget.cv));
                            },
                          ),
                        );
                      });
                      },
                    child: Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.grey10),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(IconsaxPlusBold.trash, color: Colors.red,
                              size: 20),
                          SizedBox(width: Styles.xsSpacing),
                          Text(
                            context.l10n.deleteHistory,
                            style: context.textTheme.bodySmall?.copyWith(
                                color: AppColors.danger50),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          child: Icon(IconsaxPlusBold.more_circle, color: AppColors.grey20),
          onTap: () async {
            final RenderBox button = context.findRenderObject() as RenderBox;
            final Offset offset = button.localToGlobal(Offset.zero);
            _showMoreOptions(
                context, Offset(offset.dx, offset.dy + button.size.height));
          },
        );
      },
    );
  }
}
