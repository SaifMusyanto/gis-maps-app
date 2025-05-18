import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/styles.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    required this.buttonText,
    super.key,
    this.onPressed,
    this.backgroundColor = AppColors.primary50,
    this.isOutlinedButton = false,
    this.isWhiteButton = false,
    this.fontSize,
    this.prefixIcon,
    this.suffixIcon,
  });

  final VoidCallback? onPressed;
  final String buttonText;
  final bool isOutlinedButton;
  final bool isWhiteButton;
  final double? fontSize;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color backgroundColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        elevation: 0,
        backgroundColor:
            widget.isWhiteButton || widget.isOutlinedButton ? Colors.white : widget.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Styles.mdRadius),
          side: BorderSide(
            color: widget.isWhiteButton || widget.isOutlinedButton
                ? widget.isWhiteButton ? AppColors.grey20 : AppColors.primary50
                : widget.onPressed == null ? AppColors.grey10 : AppColors.white,
          ),
        ),
      ),
      child: FittedBox(
        child: Row(
          children: [
            if (widget.prefixIcon != null)
              Icon(
                widget.prefixIcon,
                size: 18,
                color: widget.isWhiteButton ? AppColors.grey90 : widget.onPressed == null ? AppColors.grey30 : AppColors.white,
              ),
            if (widget.prefixIcon != null)
              const SizedBox(width: Styles.xsSpacing),
            Text(
              widget.buttonText,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: widget.fontSize ?? 14,
                    color: widget.isWhiteButton || widget.isOutlinedButton
                        ? widget.isWhiteButton ? AppColors.grey90 : AppColors.primary50
                        : widget.onPressed == null ? AppColors.grey30 : AppColors.white,
                  ),
            ),
            if (widget.suffixIcon != null)
              const SizedBox(width: Styles.xsSpacing),
            if (widget.suffixIcon != null)
              Icon(
                widget.suffixIcon,
                size: 18,
                color: widget.isWhiteButton ? AppColors.grey90 : widget.onPressed == null ? AppColors.grey30 : AppColors.white,
              ),
          ],
        ),
      ),
    );
  }
}
