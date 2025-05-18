import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../core/app_colors.dart';
import '../core/styles.dart';

extension CustomThemeExtension on BuildContext {

  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }

  void showSnackBar({
    required String message,
    bool isSuccess = true,
    bool isTop = false,
  }) {
    final context = this;
    final backgroundColor =
        isSuccess ? AppColors.success10 : AppColors.danger10;
    final borderColor =
        isSuccess ? AppColors.success20 : AppColors.danger20;
    final color =
        isSuccess ? AppColors.success50 : AppColors.danger50;
    var flushbar = Flushbar<void>();
    flushbar = Flushbar(
      flushbarPosition: isTop ? FlushbarPosition.TOP : FlushbarPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.symmetric(
        vertical: Styles.smPadding,
        horizontal: Styles.mdPadding,
      ),
      padding: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(Styles.lgRadius),
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      messageText: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Styles.mdRadius),
              color: color,
              border: Border.all(color: borderColor),
            ),
            child: Center(
              child: Icon(
                isSuccess ? IconsaxPlusBold.tick_circle  : IconsaxPlusBold.warning_2,
                color: AppColors.white,
                size: 16,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Styles.mdPadding),
              child:
                  Text(message, style: Theme.of(context).textTheme.bodySmall),
            ),
          ),
          GestureDetector(
            onTap: () => flushbar.dismiss(),
            child: const Icon(
              Icons.close_rounded,
              size: 16,
              color: AppColors.grey90,
            ),
          ),
          const SizedBox(width: Styles.mdSpacing),
        ],
      ),
    )

    ..show(context);
  }
}

extension CustomConverter on String {
  String replaceToNewLine() {
    return replaceAll(r'\n', '\n');
  }

  Color hexToColor() {
    final hexValue = int.parse('FF$this', radix: 16);
    return Color(hexValue);
  }

  TimeOfDay toTimeOfDay() {
    final time = split(':');
    return TimeOfDay(
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
    );
  }
}

/// Extension on [DateTime] to format it to a string with a specified locale.
extension FormattedDateTime on DateTime {
  /// Returns a formatted string representation of the [DateTime] object.

  String toFormattedDate() {
    return DateFormat('d MMMM yyyy', 'id').format(this);
  }
}

extension CustomTimeOfDay on TimeOfDay {
  bool isAfter(TimeOfDay other) {
    if (hour > other.hour) {
      return true;
    } else if (hour == other.hour) {
      return minute > other.minute;
    } else {
      return false;
    }
  }
}
