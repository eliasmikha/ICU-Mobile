import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:starter_application/core/localization/localization_provider.dart';
import 'package:starter_application/features/account/presentation/state_m/cubit/account_cubit.dart';
import 'package:starter_application/features/account/presentation/state_m/provider/profile_notifier.dart';

/// Centralizing all app providers in one class to be easy to adjust and read
class ApplicationProvider {
  static ApplicationProvider _instance = ApplicationProvider._init();

  factory ApplicationProvider() => _instance;

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];

  List<SingleChildWidget> dependItems = [
    /// Change notifier provider
    ChangeNotifierProvider.value(value: LocalizationProvider()),

    BlocProvider(
      create: (context) => AccountCubit(),
      lazy: true,
    ),

    ChangeNotifierProvider(
      create: (context) => ProfileNotifier(),
      lazy: true,
    ),
  ];

  List<SingleChildWidget> uiChangesItems = [];

  void dispose(BuildContext context) {
    Provider.of<LocalizationProvider>(context, listen: false).dispose();
    Provider.of<AccountCubit>(context, listen: false).close();
  }
}
