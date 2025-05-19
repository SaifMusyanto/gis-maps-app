import 'package:flutter/material.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../core/app_colors.dart';
import '../core/styles.dart';
import '../l10n/l10n.dart';

class CustomDropdownField extends StatefulWidget {
  const CustomDropdownField(
      {super.key,
      this.isRequired = true,
      this.readOnly = false,
      this.showOptional = false,
      this.isDense = true,
      this.label,
      this.hint,
      this.icon,
      this.onChanged, required this.items, this.value});
  final void Function(Object?)? onChanged;
  final bool isRequired, isDense, readOnly, showOptional;
  final String? label, value;
  final String? hint;
  final IconData? icon;
  final List<DropdownMenuItem<Object>> items;

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  final ValueNotifier<bool> _isEmpty = ValueNotifier<bool>(true);

  OutlineInputBorder _getBorder({Color color = AppColors.grey10}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color, width: 1));
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
                  style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
                  children: [
                if (widget.isRequired)
                  TextSpan(
                      text: '*', style: context.textTheme.labelLarge?.copyWith(color: AppColors.danger50)),
                if (widget.showOptional)
                  TextSpan(
                      text: ' (${AppLocalizations.of(context).optional})', style: context.textTheme.labelLarge?.copyWith(color: AppColors.grey50)),
              ])),
        if (widget.label != null) const SizedBox(height: 8),
        if (widget.readOnly) AbsorbPointer(child: _buildTextField()),
        if (!widget.readOnly) _buildTextField(),
      ],
    );
  }

  Widget _buildTextField() {
    return ValueListenableBuilder(
        valueListenable: _isEmpty,
        builder: (context, _, __) {
        return DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonFormField(
              icon: const Icon(IconsaxPlusBold.arrow_down, size: 16, color: AppColors.grey50),
              items: widget.items,
              onChanged: (v) {
                v.toString().isEmpty ? _isEmpty.value = true : _isEmpty.value = false;
                if (widget.onChanged != null) {
                  widget.onChanged!(v);
                }
              },
              validator: (_) {
                return widget.value == null ? 'Tidak boleh kosong' : null;
              },
              isExpanded: true,
              padding: EdgeInsets.zero,
              style: context.textTheme.labelLarge,
              value: widget.value,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(0, Styles.smPadding, Styles.xsPadding, Styles.smPadding),
                hintText: widget.hint,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.grey50),
                filled: true,
                fillColor: Colors.white,
                border: _getBorder(),
                isDense: widget.isDense,
                focusedBorder: _getBorder(color: AppColors.grey10),
                enabledBorder: _getBorder(),
                disabledBorder: _getBorder(),
                errorBorder: _getBorder(color: AppColors.danger50),
                focusedErrorBorder: _getBorder(color: AppColors.danger50),
                prefixIcon: widget.icon == null
                    ? null
                    : Padding(
                      padding: const EdgeInsets.only(left: Styles.smSpacing),
                      child: Icon(
                          widget.icon,
                          size: 16,
                          color: AppColors.grey50,
                        ),
                    ),
              ),
            ),
          ),
        );
      }
    );
  }
}
