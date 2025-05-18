import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gis_maps_app/features/cv/data/models/cv/cv_model.dart';
import 'package:gis_maps_app/features/cv/domain/usecases/analyze_cv.dart';
import 'package:gis_maps_app/features/cv/views/widgets/cv_additional_info_section.dart';
import 'package:gis_maps_app/features/cv/views/widgets/upload_cv_section.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:gis_maps_app/widgets/custom_button.dart';
import 'package:gis_maps_app/widgets/custom_page.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../injector/injector.dart';
import '../../../routes/router.dart';

@RoutePage()
class CvUploadPage extends StatefulWidget {
  const CvUploadPage({super.key});

  @override
  State<CvUploadPage> createState() => _CvUploadPageState();
}

class _CvUploadPageState extends State<CvUploadPage> {
  final _analyzeCv = Injector.instance<AnalyzeCv>();
  final TextEditingController _descriptionController = TextEditingController();
  final ValueNotifier<CvPurpose?> _selectedPurposeNotifier = ValueNotifier<CvPurpose?>(null);
  final ValueNotifier<String?> _selectedPositionNotifier = ValueNotifier<String?>(null);
  String? _uploadedFileName;
  String? _uploadedFilePath;

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      title: context.l10n.uploadcv,
      sections: [
        UploadCvSection(
          onPickPdfFile: () async {
            final result = await FlutterDocumentPicker.openDocument(
              params: FlutterDocumentPickerParams(
                allowedFileExtensions: ['pdf'],
                allowedMimeTypes: ['application/pdf'],
              ),
            );
            if (result != null) {
              final file = File(result);
              final fileSizeInBytes = await file.length();
              const maxFileSize = 5 * 1024 * 1024;

              if (fileSizeInBytes > maxFileSize) {
                setState(() {
                  _uploadedFilePath = null;
                  _uploadedFileName = null;
                });
                if (!mounted) return;
                context.showSnackBar(
                  message: context.l10n.fileSizeError,
                  isSuccess: false,
                );
                return;
              }

              setState(() {
                _uploadedFilePath = result;
                _uploadedFileName = result.split('/').last;
              });
            }
          },
          uploadedFileName: _uploadedFileName,
          uploadedFilePath: _uploadedFilePath,
        ),
        CvAdditionalInfoSection(
          descriptionController: _descriptionController,
          selectedPurpose: _selectedPurposeNotifier,
          selectedPosition: _selectedPositionNotifier,
        ),
      ],
      bottom: ValueListenableBuilder(
        valueListenable: _selectedPurposeNotifier,
        builder: (context, cvPurpose, child) {
          return CustomButton(
            buttonText: context.l10n.startAnalysis,
            suffixIcon: IconsaxPlusBold.send_2,
            onPressed: _selectedPurposeNotifier.value == null || _uploadedFileName == null ? null : () async {
              context.loaderOverlay.show();

              final res = await _analyzeCv.call(CvModel(
                fileName: _uploadedFileName,
                filePath: _uploadedFilePath,
                purpose: _selectedPurposeNotifier.value,
                position: _selectedPurposeNotifier.value == CvPurpose.career
                    ? _selectedPositionNotifier.value
                    : null,
                description: _descriptionController.text == '' ? null : _descriptionController.text,
                createdAt: DateTime.now(),
              ));

              res.fold((failure) {
                context.loaderOverlay.hide();
                context.showSnackBar(
                  message: failure.message,
                  isSuccess: false,
                );
              }, (cvModel) {
                context.loaderOverlay.hide();
                context.showSnackBar(
                  message: context.l10n.analysisSuccess,
                );
                context.router.replace(AnalysisResultRoute(cv: cvModel));
              });
            },
          );
        }
      ),
    );
  }
}