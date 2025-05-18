import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/styles.dart';
import 'custom_app_bar.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({super.key, required this.title, required this.sections, this.bottom, this.trailing, this.onBackPressed, this.isBackDisabled = false});

  final String title;
  final List<Widget> sections;
  final Widget? bottom;
  final Widget? trailing;
  final VoidCallback? onBackPressed;
  final bool isBackDisabled;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isBackDisabled) {
          return false;
        }
        if (onBackPressed != null) {
          onBackPressed!();
          return false;
        }
        return true;
      },
      child: Scaffold(
          body: Column(
            children: [
              CustomAppBar(
                title: title,
                trailing: trailing,
                onBackPressed: isBackDisabled ? null : onBackPressed,
                isShowBackButton: !isBackDisabled,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: Styles.smPadding),
                  child: Column(
                    spacing: Styles.smSpacing,
                    children: sections,
                  ),
                ),
              ),
              if (bottom != null) Container(
                  padding: EdgeInsets.symmetric(
                    vertical: Styles.mdPadding,
                    horizontal: Styles.xlPadding,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: Styles.defaultShadow,
                  ),
                  child: bottom!,
              ),
            ],
          )
      ),
    );
  }
}
