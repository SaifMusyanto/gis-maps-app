import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gis_maps_app/features/onboarding/views/onboarding_page.dart';
import '../features/pages.dart';
import '../features/cv/data/models/cv/cv_model.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        CustomRoute<void>(
          page: SplashRoute.page,
          path: '/splash',
          initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute<void>(
          page: OnboardingRoute.page,
          path: '/onboarding',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute<void>(
          page: DashboardRoute.page,
            path: '/dashboard',
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 300,
            children: [
              CustomRoute<void>(
                  page: CvRoute.page,
                  path: 'cv',
                  transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute<void>(
                page: AccountRoute.page,
                path: 'account',
                transitionsBuilder: TransitionsBuilders.fadeIn,
              )
            ]
          ),  
        CustomRoute<void>(
          page: CvUploadRoute.page,
          path: '/cv-upload',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute<void>(
          page: AnalysisResultRoute.page,
          path: '/analysis_result',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute<void>(
          page: AboutAppRoute.page,
          path: '/about-app',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ];
}
