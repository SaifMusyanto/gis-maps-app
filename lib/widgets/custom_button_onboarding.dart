import 'package:flutter/material.dart';
import 'package:gis_maps_app/util/extensions.dart';
import '../core/app_colors.dart';
import '../core/styles.dart';

class CustomButtonOnboarding extends StatefulWidget {
  const CustomButtonOnboarding({
    required this.buttonText,
    super.key,
    this.onPressed,
    this.backgroundColor = AppColors.primary50,
    this.isWhiteButton = false,
    this.fontSize,
    this.prefixIcon,
    this.suffixIcon,
  });

  final VoidCallback? onPressed;
  final String buttonText;
  final bool isWhiteButton;
  final double? fontSize;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color backgroundColor;

  @override
  State<CustomButtonOnboarding> createState() => _CustomButtonOnboardingState();
}

class _CustomButtonOnboardingState extends State<CustomButtonOnboarding> {
  @override
  Widget build(BuildContext context) {
    if (widget.isWhiteButton) {
      // Tombol putih dengan border
      return OutlinedButton(
        onPressed: widget.onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
          side: const BorderSide(color: AppColors.primary50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Styles.mdRadius),
          ),
        ),
        child: _buildContent(
          textColor: AppColors.primary50,
          iconColor: AppColors.primary50,
        ),
      );
    }

    // Tombol dengan gradient
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(Styles.mdRadius),
        ),
        child: Center(
          child: _buildContent(
            textColor: Colors.white,
            iconColor: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildContent({required Color textColor, required Color iconColor}) {
    return FittedBox(
      child: Row(
        children: [
          if (widget.prefixIcon != null) ...[
            Icon(
              widget.prefixIcon, 
              size: 18, 
              color: iconColor
            ),
            const SizedBox(
              width: Styles.xsSpacing
            ),
          ],
          Text(
            widget.buttonText,
            style: context.textTheme.titleSmall?.copyWith(
              fontSize: widget.fontSize ?? 14,
              fontWeight: FontWeight.bold,
              color: textColor,
            )
          ),
          if (widget.suffixIcon != null) ...[
            const SizedBox(width: Styles.xsSpacing),
            Icon(
              widget.suffixIcon, 
              size: 18, 
              color: iconColor
            ),
          ],
        ],
      ),
    );
  }
}
