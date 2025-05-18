import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sizer/sizer.dart';

import '../core/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.controller,
    super.key,
    this.validator,
    this.isRequired = true,
    this.isPassword = false,
    this.isDense = false,
    this.isRounded = true,
    this.expands = false,
    this.autofocus = false,
    this.label,
    this.hint,
    this.icon,
    this.suffixIcon,
    this.textInputType,
    this.onChanged,
    this.maxLines = 1,
    this.minLines = 1,
    this.focusNode,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final bool isRequired;
  final bool isPassword;
  final bool isDense;
  final String? label;
  final String? hint;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final bool isRounded;
  final bool expands;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final FocusNode? focusNode;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isShowPassword = true;

  InputBorder _getBorder({Color color = AppColors.grey10}) {
    return widget.isRounded
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: color),
          )
        : const UnderlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          RichText(
            text: TextSpan(
              text: widget.label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
              children: [
                if (widget.isRequired)
                  const TextSpan(
                    text: '*',
                    style: TextStyle(color: AppColors.danger50),
                  ),
              ],
            ),
          ),
        if (widget.label != null) const SizedBox(height: 8),
        TextFormField(
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          expands: widget.expands,
          onChanged: widget.onChanged,
          controller: widget.controller,
          validator: widget.validator,
          style: Theme.of(context).textTheme.labelLarge,
          obscureText: widget.isPassword ? _isShowPassword : false,
          keyboardType: widget.textInputType ?? TextInputType.text,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: AppColors.grey50),
            filled: true,
            fillColor: Colors.white,
            border: _getBorder(),
            isDense: widget.isDense,
            focusedBorder: _getBorder(
              color:
                  widget.isRounded ? AppColors.primary50 : Colors.transparent,
            ),
            enabledBorder: _getBorder(),
            disabledBorder: _getBorder(),
            errorBorder: _getBorder(color: AppColors.danger50),
            focusedErrorBorder: _getBorder(color: AppColors.danger50),
            prefixIcon: widget.icon == null
                ? null
                : Icon(
                    widget.icon,
                    size: 16,
                    color: AppColors.grey50,
                  ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 60,
            ),
            suffixIcon: widget.suffixIcon != null ? Icon(
              widget.suffixIcon,
              size: 16,
              color: AppColors.grey50,
            )
              : widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _isShowPassword = !_isShowPassword;
                      });
                    },
                    child: Icon(
                      size: 5.5.w,
                      _isShowPassword ? IconsaxPlusBold.eye_slash : IconsaxPlusBold.eye,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
