import 'package:flutter/material.dart';
import 'package:gis_maps_app/core/styles.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/util/extensions.dart';

class AccountProfile extends StatefulWidget {
  const AccountProfile({super.key});

  @override
  State<StatefulWidget> createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Styles.mdPadding,
        horizontal: Styles.xlPadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: Styles.defaultShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: Styles.mdPadding,
              horizontal: Styles.mdPadding,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary10,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 21.5,
                  backgroundColor: AppColors.primary50,
                  child: const Text(
                    'H',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sahabat Hireka',
                        style: context.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Mode Tamu',
                        style: context.textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
