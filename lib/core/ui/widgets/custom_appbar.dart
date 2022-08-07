import 'package:flutter/material.dart';
import 'package:starter_application/core/common/app_colors.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/theme/custom_theme_colors.dart';

import '../../navigation/nav.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({
    Key? key,
    this.withLeading = true,
    this.withLeadingBackground = false,
    this.title,
    this.actions,
    this.backgroundColor,
    this.appbarHeight,
  })  : preferredSize = Size.fromHeight(
          appbarHeight ?? AppConstants.appbarHeight,
        ),
        super(key: key);

  final double? appbarHeight;
  final bool withLeading, withLeadingBackground;
  final String? title;
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return AppBar(
      elevation: 0,
      toolbarHeight: appbarHeight ?? AppConstants.appbarHeight,
      centerTitle: true,
      backgroundColor: backgroundColor,
      title: title == null
          ? null
          : Text(
              title!,
              style: themeData.textTheme.headline4?.copyWith(
                fontWeight: FontWeight.bold,
                color: themeData.extension<CustomThemeColors>()!.textColor,
              ),
            ),
      leading: withLeading
          ? SizedBox(
              height: 20,
              width: 20,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: withLeadingBackground
                      ? themeData.colorScheme.primary
                      : null,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color:
                            themeData.extension<CustomThemeColors>()!.textColor,
                      ),
                      onTap: Nav.pop,
                    ),
                  ),
                ),
              ),
            )
          : null,
      actions: actions,
      automaticallyImplyLeading: false,
    );
  }
}
