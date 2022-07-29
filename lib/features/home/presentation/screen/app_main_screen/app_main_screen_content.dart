import 'package:flutter/material.dart';

import '../home_screen/home_screen.dart';

class AppMAinScreenContent extends StatefulWidget {
  const AppMAinScreenContent({Key? key}) : super(key: key);

  @override
  State<AppMAinScreenContent> createState() => _AppMAinScreenContentState();
}

class _AppMAinScreenContentState extends State<AppMAinScreenContent> {
  @override
  Widget build(BuildContext context) {
    return HomeScreen(param: HomeScreenParam());
  }
}
