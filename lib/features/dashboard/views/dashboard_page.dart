import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/core/styles.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:gis_maps_app/routes/router.dart';

@RoutePage()
class DashboardPage extends  StatefulWidget{
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: [
          CvRoute(),
          AccountRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return Container(
            padding: EdgeInsets.only(top: Styles.xxsSpacing, bottom: Styles.smSpacing),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: Styles.defaultShadow,
            ),
            child: NavigationBar(
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: tabsRouter.setActiveIndex,
              destinations: [
                NavigationDestination(
                  icon: const Icon(IconsaxPlusBold.document_text),
                  label: context.l10n.cv,
                ),
                NavigationDestination(
                  icon: const Icon(IconsaxPlusBold.profile),
                  label: context.l10n.account,
                ),
              ],
            ),
          );
        }
    );
  }
}
