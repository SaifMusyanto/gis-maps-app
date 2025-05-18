import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gis_maps_app/core/styles.dart';
import 'package:gis_maps_app/database/shared_preferences_service.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:gis_maps_app/routes/router.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:sizer/sizer.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    navigateToNextPage();

    super.initState();
  }

  void navigateToNextPage() {
    bool isFirstTime = SharedPreferencesService.getIsFirstTime();
    if (isFirstTime) {
      context.router.replace(const OnboardingRoute());
    } else {
      context.router.replace(const DashboardRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: Styles.smSpacing,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: Styles.smSpacing,
              children: [
                Image.asset(
                  'assets/core/img_hireka.png',
                  width: 48,
                ),
                Text(
                  context.l10n.hireka,
                  style: context.textTheme.headlineLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
