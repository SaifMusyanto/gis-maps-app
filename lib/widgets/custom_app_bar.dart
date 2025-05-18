import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/styles.dart';
import 'back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    super.key,
    this.actions,
    this.trailing,
    this.onBackPressed,
    this.isShowBackButton = true,
  });

  final String title;
  final List<Widget>? actions;
  final Widget? trailing;
  final VoidCallback? onBackPressed;
  final bool isShowBackButton;

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();
    final widgets = <Widget>[...?actions];

    if (trailing != null) {
      widgets.add(trailing!);
    }

    if (widgets.isNotEmpty) {
      widgets.add(
        const SizedBox(
          width: Styles.mdPadding,
        ),
      );
    }

    return AppBar(
      backgroundColor: AppColors.white,
      automaticallyImplyLeading: canPop,
      leadingWidth: 100,
      shadowColor: AppColors.black.withOpacity(0.6),
      toolbarHeight: kToolbarHeight + 10,
      leading: Container(
        margin: const EdgeInsets.only(left: Styles.mdPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (canPop && isShowBackButton) CustomBackButton(onPressed: onBackPressed),
          ],
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: widgets,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
