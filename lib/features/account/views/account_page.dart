import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gis_maps_app/features/account/views/widgets/account_others.dart';
import 'package:gis_maps_app/features/account/views/widgets/account_profile.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:gis_maps_app/widgets/custom_page.dart';
import 'package:gis_maps_app/widgets/custom_section.dart';

@RoutePage()
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  
  @override
  Widget build(BuildContext context) {
    return CustomPage(
      title: context.l10n.account,
      isBackDisabled: true,
      sections: [
      AccountProfile(),
      AccountOthers(),
      ],
    );
  }
}
