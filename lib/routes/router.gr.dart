// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AboutAppPage]
class AboutAppRoute extends PageRouteInfo<void> {
  const AboutAppRoute({List<PageRouteInfo>? children})
    : super(AboutAppRoute.name, initialChildren: children);

  static const String name = 'AboutAppRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AboutAppPage();
    },
  );
}

/// generated route for
/// [AccountPage]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
    : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AccountPage();
    },
  );
}

/// generated route for
/// [AnalysisResultPage]
class AnalysisResultRoute extends PageRouteInfo<AnalysisResultRouteArgs> {
  AnalysisResultRoute({
    Key? key,
    required CvModel cv,
    bool isSaved = false,
    List<PageRouteInfo>? children,
  }) : super(
         AnalysisResultRoute.name,
         args: AnalysisResultRouteArgs(key: key, cv: cv, isSaved: isSaved),
         initialChildren: children,
       );

  static const String name = 'AnalysisResultRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AnalysisResultRouteArgs>();
      return AnalysisResultPage(
        key: args.key,
        cv: args.cv,
        isSaved: args.isSaved,
      );
    },
  );
}

class AnalysisResultRouteArgs {
  const AnalysisResultRouteArgs({
    this.key,
    required this.cv,
    this.isSaved = false,
  });

  final Key? key;

  final CvModel cv;

  final bool isSaved;

  @override
  String toString() {
    return 'AnalysisResultRouteArgs{key: $key, cv: $cv, isSaved: $isSaved}';
  }
}

/// generated route for
/// [CvPage]
class CvRoute extends PageRouteInfo<void> {
  const CvRoute({List<PageRouteInfo>? children})
    : super(CvRoute.name, initialChildren: children);

  static const String name = 'CvRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CvPage();
    },
  );
}

/// generated route for
/// [CvUploadPage]
class CvUploadRoute extends PageRouteInfo<void> {
  const CvUploadRoute({List<PageRouteInfo>? children})
    : super(CvUploadRoute.name, initialChildren: children);

  static const String name = 'CvUploadRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CvUploadPage();
    },
  );
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
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingPage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}
