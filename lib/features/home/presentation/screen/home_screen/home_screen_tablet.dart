import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/common/responsive/responsive_utils.dart';

import 'package:starter_application/core/ui/clippers/theme_circle_clipper.dart';
import 'package:starter_application/features/home/presentation/state_m/provider/home_screen_notifier.dart';
import 'package:starter_application/generated/l10n.dart';

class HomeScreenTablet extends StatelessWidget {
  const HomeScreenTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Theme(
        data: Theme.of(context),
        child: ModalProgressHUD(
            inAsyncCall: provider(context).isLoading,
            child: _buildHomeScreen(context)),
      ),
    );
  }

  Scaffold _buildHomeScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          provider(context).getHomeScreenTitle(context),
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: _buildHomeScreenBody(context),
    );
  }

  Padding _buildHomeScreenBody(BuildContext context) {
    final children = [
      Expanded(
        child: _buildContent(context),
      ),
      _buildOptionsList(context),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Flex(
        direction: getValueForOrientation(context,
            portrait: Axis.vertical, landscape: Axis.horizontal)!,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: getValueForOrientation(
          context,
          portrait: children,
          landscape: children.reversed.toList(),
        )!,
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        24.verticalSpace,
        const Text("Translation test"),
        10.verticalSpace,
        Text(
          S.current.welcome,
        ),
      ],
    );
  }

  Widget _buildOptionsList(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Flex(
        direction: getValueForOrientation(context,
            portrait: Axis.horizontal, landscape: Axis.vertical)!,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Tooltip(
            message: "Change Theme",
            child: ThemeSwitcher(
              clipper: const CustomThemeSwitcherCircleClipper(),
              builder: (context) => IconButton(
                onPressed: () => provider(context, listen: false)
                    .onThemeSwitcherTap(context),
                icon: Icon(
                  provider(context).getThemeIcon(context),
                ),
              ),
            ),
          ),
          const Divider(),
          _buildOptionsIcon(
            context: context,
            onPressed: () {
              provider(context, listen: false)
                  .onChangeLanguageDialogTap(context);
            },
            icon: Icons.language,
            titleMessage: S.current.changeLanguage,
          ),
          const Divider(),
          _buildOptionsIcon(
            context: context,
            onPressed: () {
              provider(context, listen: false).onJustLogTap();
            },
            icon: Icons.info,
            titleMessage: S.current.justLog,
          ),
          const Divider(),
          _buildOptionsIcon(
            context: context,
            onPressed: () {
              provider(context, listen: false).onTestSuccessRequestTap();
            },
            icon: Icons.check,
            titleMessage: S.current.testSuccessRequest,
          ),
          _buildOptionsIcon(
            context: context,
            onPressed: () {
              provider(context, listen: false).onTestFailurRequestTap();
            },
            icon: Icons.close,
            titleMessage: S.current.testFailureRequest,
          ),
          _buildOptionsIcon(
            context: context,
            onPressed: () {
              provider(context, listen: false).onTestValidatorRequestTap();
            },
            icon: Icons.vertical_align_top_rounded,
            titleMessage: S.current.testValidatorRequest,
          ),
          const Divider(),
          _buildOptionsIcon(
            context: context,
            onPressed: () {
              provider(context, listen: false).onGetPeopleTap(context);
            },
            icon: Icons.people,
            titleMessage: S.current.getPeople,
          ),
          const Divider(),
          _buildOptionsIcon(
            context: context,
            onPressed: () {
              // provider(context, listen: false).onGetPokemonsTap(context);
            },
            icon: Icons.catching_pokemon,
            titleMessage: S.current.getPokemons,
          ),
          const Divider(),
          _buildOptionsIcon(
            context: context,
            onPressed: () {
              provider(context, listen: false).onMapTap();
            },
            icon: Icons.map,
            titleMessage: S.current.getPokemons,
          ),
          const Divider(),
          _buildOptionsIcon(
            context: context,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => null!,
                ),
              );
            },
            icon: Icons.report_gmailerrorred_outlined,
            titleMessage: S.current.testErrorScreen,
          ),
          const Divider(),
          _buildOptionsIcon(
              context: context,
              onPressed: () =>
                  provider(context, listen: false).onLogoutTap(context),
              icon: Icons.logout,
              titleMessage: S.current.logOut),
          const Divider(),
        ],
      ),
    );
  }

  /// Widget

  Widget _buildOptionsIcon({
    required BuildContext context,
    required IconData icon,
    required String titleMessage,
    required VoidCallback onPressed,
  }) {
    return Tooltip(
      message: titleMessage,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
        ),
      ),
    );
  }

  /// Logic

  HomeScreenNotifier provider(BuildContext context, {bool listen = true}) =>
      Provider.of<HomeScreenNotifier>(context, listen: listen);
}
