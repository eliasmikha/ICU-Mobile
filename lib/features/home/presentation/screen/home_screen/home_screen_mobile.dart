import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'package:starter_application/core/theme/custom_theme_colors.dart';
import 'package:starter_application/core/ui/clippers/theme_circle_clipper.dart';
import 'package:starter_application/features/home/presentation/state_m/provider/home_screen_notifier.dart';
import 'package:starter_application/generated/l10n.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Theme(
        data: Theme.of(context),
        child: ModalProgressHUD(
          inAsyncCall: provider(context).isLoading,
          child: _buildHomeScreen(context),
        ),
      ),
    );
  }

  Scaffold _buildHomeScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          provider(context).getHomeScreenTitle(context),
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: _buildHomeScreenBody(context),
      drawer: _drawerList(context),
    );
  }

  Widget _buildHomeScreenBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          24.verticalSpace,
          const Text("Translation test"),
          10.verticalSpace,
          Text(S.current.welcome),
          TextButton(
            onPressed: () {},
            child: const Text("Test Custom theme color"),
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context)
                  .extension<CustomThemeColors>()!
                  .testButtonColor,
            ),
          ),
        ],
      ),
    );
  }

  Drawer _drawerList(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary,
              child: DrawerHeader(
                child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: _themeSwitcher(),
                ),
              ),
            ),
            // ListTile(
            //   title: Text(
            //     S.current.changeLanguage,
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            //   onTap: () {
            //     provider(context, listen: false)
            //         .onChangeLanguageDialogTap(context);
            //   },
            //   trailing: const Icon(Icons.language),
            // ),
            // const Divider(),
            // ListTile(
            //   title: Text(
            //     S.current.justLog,
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            //   onTap: () {
            //     provider(context, listen: false).onJustLogTap();
            //   },
            //   trailing: const Icon(Icons.info),
            // ),
            // const Divider(),
            // ListTile(
            //   title: Text(
            //     S.current.testSuccessRequest,
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            //   onTap: () {
            //     provider(context, listen: false).onTestSuccessRequestTap();
            //   },
            //   trailing: const Icon(Icons.check),
            // ),
            // ListTile(
            //   title: Text(
            //     S.current.testFailureRequest,
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            //   onTap: () {
            //     provider(context, listen: false).onTestFailurRequestTap();
            //   },
            //   trailing: const Icon(Icons.close),
            // ),
            // ListTile(
            //   title: Text(
            //     S.current.testValidatorRequest,
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            //   onTap: () {
            //     provider(context, listen: false).onTestValidatorRequestTap();
            //   },
            //   trailing: const Icon(Icons.vertical_align_top_rounded),
            // ),
            // const Divider(),
            // ListTile(
            //   title: Text(
            //     S.current.getPeople,
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            //   onTap: () {
            //     provider(context, listen: false).onGetPeopleTap(context);
            //   },
            //   trailing: const Icon(Icons.people),
            // ),
            // ListTile(
            //   title: Text(
            //     "Get Comments",
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            //   onTap: () {
            //     // provider(context, listen: false).onGetCommentsTap(context);
            //   },
            //   trailing: const Icon(Icons.comment),
            // ),
            // ListTile(
            //   title: Text(
            //     "Map",
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            //   onTap: () {
            //     provider(context, listen: false).onMapTap();
            //   },
            //   trailing: const Icon(Icons.map),
            // ),
            // const Divider(),
            // ListTile(
            //   title: Text(
            //     S.current.getPokemons,
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            //   onTap: () {
            //     // provider(context, listen: false).onGetPokemonsTap(context);
            //   },
            //   trailing: const Icon(Icons.catching_pokemon),
            // ),
            // const Divider(),
            // ListTile(
            //   title: Text(
            //     S.current.testErrorScreen,
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            //   onTap: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => null!,
            //       ),
            //     );
            //   },
            //   trailing: const Icon(Icons.report_gmailerrorred_outlined),
            // ),
            // const Divider(),
            ListTile(
              title: Text(
                S.current.logOut,
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () =>
                  provider(context, listen: false).onLogoutTap(context),
              trailing: const Icon(Icons.logout),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget _themeSwitcher() {
    return ThemeSwitcher(
      clipper: const CustomThemeSwitcherCircleClipper(),
      builder: (context) {
        return IconButton(
          icon: Icon(
            provider(context).getThemeIcon(context),
          ),
          onPressed: () {
            provider(context, listen: false).onThemeSwitcherTap(context);
          },
        );
      },
    );
  }

  /// Logic

  HomeScreenNotifier provider(BuildContext context, {bool listen = true}) =>
      Provider.of<HomeScreenNotifier>(context, listen: listen);
}
