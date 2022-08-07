import 'package:flutter/material.dart';
import 'package:starter_application/core/common/local_storage.dart';
import 'package:starter_application/core/params/id_param.dart';
import 'package:starter_application/features/persons/presentation/state_m/cubit/persons_cubit.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../screen/persons_list/persons_list_screen.dart';

class PersonsListScreenNotifier extends ScreenNotifier {
  /// Constructors
  PersonsListScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final PersonsListScreenParam param;
  final personsCubit = PersonsCubit();

  /// Getters and Setters

  /// Methods
  void loadPersons() {
    personsCubit.getPersonsList(
      IdParam(int.tryParse(LocalStorage.profile?.id ?? '') ?? -1),
    );
  }

  @override
  void closeNotifier() {
    personsCubit.close();
    this.dispose();
  }
}
