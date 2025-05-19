// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [ChoroplethMapPage]
class ChoroplethMapRoute extends PageRouteInfo<void> {
  const ChoroplethMapRoute({List<PageRouteInfo>? children})
    : super(ChoroplethMapRoute.name, initialChildren: children);

  static const String name = 'ChoroplethMapRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChoroplethMapPage();
    },
  );
}

/// generated route for
/// [CoordinateDetailPage]
class CoordinateDetailRoute extends PageRouteInfo<CoordinateDetailRouteArgs> {
  CoordinateDetailRoute({
    Key? key,
    required FaskesModel location,
    List<PageRouteInfo>? children,
  }) : super(
         CoordinateDetailRoute.name,
         args: CoordinateDetailRouteArgs(key: key, location: location),
         initialChildren: children,
       );

  static const String name = 'CoordinateDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CoordinateDetailRouteArgs>();
      return CoordinateDetailPage(key: args.key, location: args.location);
    },
  );
}

class CoordinateDetailRouteArgs {
  const CoordinateDetailRouteArgs({this.key, required this.location});

  final Key? key;

  final FaskesModel location;

  @override
  String toString() {
    return 'CoordinateDetailRouteArgs{key: $key, location: $location}';
  }
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardPage();
    },
  );
}

/// generated route for
/// [MapFilterPage]
class MapFilterRoute extends PageRouteInfo<MapFilterRouteArgs> {
  MapFilterRoute({
    Key? key,
    required List<FaskesModel> locations,
    List<PageRouteInfo>? children,
  }) : super(
         MapFilterRoute.name,
         args: MapFilterRouteArgs(key: key, locations: locations),
         initialChildren: children,
       );

  static const String name = 'MapFilterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MapFilterRouteArgs>();
      return MapFilterPage(key: args.key, locations: args.locations);
    },
  );
}

class MapFilterRouteArgs {
  const MapFilterRouteArgs({this.key, required this.locations});

  final Key? key;

  final List<FaskesModel> locations;

  @override
  String toString() {
    return 'MapFilterRouteArgs{key: $key, locations: $locations}';
  }
}

/// generated route for
/// [PinpointMapPage]
class PinpointMapRoute extends PageRouteInfo<void> {
  const PinpointMapRoute({List<PageRouteInfo>? children})
    : super(PinpointMapRoute.name, initialChildren: children);

  static const String name = 'PinpointMapRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PinpointMapPage();
    },
  );
}
