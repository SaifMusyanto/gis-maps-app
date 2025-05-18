import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:gis_maps_app/routes/router.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:gis_maps_app/widgets/custom_button_onboarding.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:gis_maps_app/core/app_colors.dart';

import '../../../core/styles.dart';
import '../../../database/shared_preferences_service.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  Future<void> _goToNextPage() async {
    if (currentIndex < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      await SharedPreferencesService.setIsFirstTime(value: false);
      context.router.replace(const DashboardRoute());
    }
  }

  void _goToPreviousPage() {
    if (currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skip() {
    _controller.animateToPage(
      2,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final newIndex = _controller.page?.round() ?? 0;
      if (newIndex != currentIndex) {
        setState(() {
          currentIndex = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/core/img_hireka.png',
                    width: 10.w,
                  ),
                  SizedBox(
                    width: Styles.smSpacing,
                  ),
                  Text(
                    context.l10n.hireka,
                    style: context.textTheme.displaySmall,
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  controller: _controller,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _buildContent('assets/core/gif_onboarding1.gif', context.l10n.onboardingTitle1, context.l10n.onboardingDescription1),
                    _buildContent('assets/core/gif_onboarding2.gif', context.l10n.onboardingTitle2, context.l10n.onboardingDescription2),
                    _buildContent('assets/core/gif_onboarding3.gif', context.l10n.onboardingTitle3, context.l10n.onboardingDescription3),
                  ],
                ),
              ),
              AnimatedSmoothIndicator(
                activeIndex: currentIndex,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: AppColors.primary50,
                  dotColor: Colors.grey.shade300,
                  expansionFactor: 4,
                  spacing: 8,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              currentIndex == 2
                  ? SizedBox(
                width: double.infinity,
                child: CustomButtonOnboarding(
                  buttonText: 'Mulai Sekarang!',
                  onPressed: _goToNextPage,
                ),
              )
                  : Row(
                children: [
                  if (currentIndex == 0)
                    Expanded(
                      child: CustomButtonOnboarding(
                        buttonText: 'Lewati',
                        isWhiteButton: true,
                        onPressed: _skip,
                      ),
                    )
                  else
                    Expanded(
                      child: CustomButtonOnboarding(
                        buttonText: 'Kembali',
                        isWhiteButton: true,
                        onPressed: _goToPreviousPage,
                      ),
                    ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: CustomButtonOnboarding(
                      buttonText: 'Lanjut',
                      onPressed: _goToNextPage,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(String image, String title, String description) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            width: 100.w,
            height: 36.h,
            fit: BoxFit.contain,
          ),
          Text(
            title,
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 13,
              color: AppColors.grey70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
