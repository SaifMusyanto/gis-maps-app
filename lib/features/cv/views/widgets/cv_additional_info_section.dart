import 'package:flutter/material.dart';
import 'package:gis_maps_app/core/styles.dart';
import 'package:gis_maps_app/features/cv/data/models/cv/cv_model.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:gis_maps_app/widgets/custom_section.dart';
import 'package:gis_maps_app/widgets/custom_text_field.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../widgets/custom_dropdown_field.dart';

class CvAdditionalInfoSection extends StatefulWidget {
  const CvAdditionalInfoSection({super.key, required this.descriptionController, required this.selectedPurpose, required this.selectedPosition});

  final TextEditingController descriptionController;
  final ValueNotifier<CvPurpose?> selectedPurpose;
  final ValueNotifier<String?> selectedPosition;

  @override
  State<CvAdditionalInfoSection> createState() => _CvAdditionalInfoSectionState();
}

class _CvAdditionalInfoSectionState extends State<CvAdditionalInfoSection> {
  List<DropdownMenuItem<String>> _purposes = [];
  List<DropdownMenuItem<String>> _careerPositions = [];

  void _initData() {
    _purposes = [
      DropdownMenuItem(
        value: CvPurpose.career.name,
        child: Text(context.l10n.career),
      ),
      DropdownMenuItem(
        value: CvPurpose.scholarship.name,
        child: Text(context.l10n.scholarship),
      ),
      DropdownMenuItem(
        value: CvPurpose.organization.name,
        child: Text(context.l10n.organization),
      ),
    ];

    _careerPositions = [
      DropdownMenuItem(
        value: context.l10n.frontEndDeveloper,
        child: Text(context.l10n.frontEndDeveloper),
      ),
      DropdownMenuItem(
        value: context.l10n.backEndDeveloper,
        child: Text(context.l10n.backEndDeveloper),
      ),
      DropdownMenuItem(
        value: context.l10n.mobileDeveloper,
        child: Text(context.l10n.mobileDeveloper),
      ),
      DropdownMenuItem(
        value: context.l10n.uiUxDesigner,
        child: Text(context.l10n.uiUxDesigner),
      ),
      DropdownMenuItem(
        value: context.l10n.dataEngineer,
        child: Text(context.l10n.dataEngineer,),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (_purposes.isEmpty || _careerPositions.isEmpty) {
      _initData();
    }

    return CustomSection(
      icon: IconsaxPlusBold.edit,
      title: context.l10n.additionalInfo,
      description: context.l10n.additionalInfoDesc,
      child: ValueListenableBuilder(
        valueListenable: widget.selectedPurpose,
        builder: (context, CvPurpose? selectedPurpose, child) {
          String descriptionLabel = '';
          String descriptionHint = '';
          if (widget.selectedPurpose.value == CvPurpose.career) {
            descriptionLabel = context.l10n.careerDescription;
            descriptionHint = context.l10n.careerDescriptionHint;
          } else if (widget.selectedPurpose.value == CvPurpose.scholarship) {
            descriptionLabel = context.l10n.scholarshipDescription;
            descriptionHint = context.l10n.scholarshipDescriptionHint;
          } else if (widget.selectedPurpose.value == CvPurpose.organization) {
            descriptionLabel = context.l10n.organizationDescription;
            descriptionHint = context.l10n.organizationDescriptionHint;
          }

          return Column(
            spacing: Styles.smSpacing,
            children: [
              CustomDropdownField(
                label: context.l10n.cvPurpose,
                hint: context.l10n.cvPurposeHint,
                icon: IconsaxPlusBold.document_normal,
                value: selectedPurpose?.name,
                items: _purposes,
                onChanged: (value) {
                  if (value != null) {
                    widget.selectedPurpose.value = CvPurpose.values.firstWhere((element) => element.name == value);
                  }
                },
              ),
              if (selectedPurpose != null && selectedPurpose == CvPurpose.career)
                ValueListenableBuilder(
                  valueListenable: widget.selectedPosition,
                  builder: (context, String? selectedPosition, child) {
                    return CustomDropdownField(
                      label: context.l10n.careerPosition,
                      hint: context.l10n.careerPositionHint,
                      isRequired: false,
                      icon: IconsaxPlusBold.briefcase,
                      value: widget.selectedPosition.value,
                      items: _careerPositions,
                      onChanged: (value) {
                        if (value == widget.selectedPosition.value) {
                          widget.selectedPosition.value = null;
                        } else {
                          widget.selectedPosition.value = value.toString();
                        }
                      },
                    );
                  }
                ),
              if (selectedPurpose != null) CustomTextField(
                controller: widget.descriptionController,
                isRequired: false,
                label: descriptionLabel,
                hint: descriptionHint,
                icon: IconsaxPlusBold.info_circle,
                minLines: 4,
                maxLines: 8,
              ),
            ],
          );
        }
      ),
    );
  }
}
