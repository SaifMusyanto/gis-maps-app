import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gis_maps_app/core/styles.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:gis_maps_app/routes/router.dart';
import 'package:gis_maps_app/widgets/custom_menu_page.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class AccountOthers extends StatefulWidget {
  const AccountOthers({super.key});

  @override
  State<StatefulWidget> createState() => _AccountOthersState();
}

class _AccountOthersState extends State<AccountOthers> {
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
          // Judul section "Lainnya"
          Text(
            context.l10n.others,
            style: context.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.grey90,
            ),
          ),
          SizedBox(height: Styles.xsSpacing),

          // Menu item: Bantuan & Dukungan
          CustomMenuPage(
            icon: IconsaxPlusBold.notification,
            iconColor: AppColors.white,
            title: 'Bantuan & Dukungan',
            onTap: () {
              
            },
          ),

          // Menu item: Tentang Aplikasi
          CustomMenuPage(
            icon: IconsaxPlusBold.info_circle,
            iconColor: AppColors.white,
            title: 'Tentang Aplikasi',
            onTap: () {
              context.router.push((AboutAppRoute()));
            },
          ),
        ],
      ),
    );
  }
}
