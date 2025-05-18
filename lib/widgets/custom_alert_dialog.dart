import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/styles.dart';
import 'custom_button.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    required this.title,
    super.key,
    this.description,
    this.descriptionWidget,
    this.proceedText,
    this.proceedAction,
    this.cancelText,
    this.cancelAction,
    this.isDanger = false,
  });

  final String title;
  final String? description;
  final Widget? descriptionWidget;
  final String? proceedText;
  final String? cancelText;
  final void Function()? proceedAction;
  final void Function()? cancelAction;
  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    final Widget proceedButton = CustomButton(
      onPressed: () {
        Navigator.of(context).pop();
        proceedAction?.call();
      },
      backgroundColor: isDanger ? AppColors.danger50 : AppColors.primary50,
      buttonText: proceedText ?? 'Ya',
    );

    final Widget cancelButton = CustomButton(
      onPressed: () {
        Navigator.of(context).pop();
        cancelAction?.call();
      },
      buttonText: cancelText ?? 'Tidak',
      isOutlinedButton: true,
    );

    final alert = Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              descriptionWidget ??
                  Text(
                    description ?? '',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
              const SizedBox(
                height: Styles.xlSpacing,
              ),
              Row(
                children: [
                  if (proceedAction != null) Expanded(child: cancelButton),
                  if (proceedAction != null)
                    const SizedBox(
                      width: Styles.smSpacing,
                    ),
                  Expanded(child: proceedButton),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    return alert;
  }
}
