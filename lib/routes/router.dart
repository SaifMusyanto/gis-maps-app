import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gis_maps_app/features/dashboard/views/choropleth_map_page.dart';
import 'package:gis_maps_app/features/dashboard/views/pin_map_page.dart';
import '../features/pages.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        CustomRoute<void>(
            page: DashboardRoute.page,
            path: '/dashboard',
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 300,
            initial: true,
            children: [
              CustomRoute<void>(
                  page: ChoroplethMapRoute.page,
                  path: 'choropleth',
                  transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute<void>(
                page: PinMapRoute.page,
                path: 'pin',
                transitionsBuilder: TransitionsBuilders.fadeIn,
              )
            ]),
      ];
}
