import 'package:flutter/material.dart';
import 'package:starter_application/core/ui/widgets/custom_list_tile.dart';
import 'package:starter_application/features/persons/presentation/state_m/cubit/persons_cubit.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../../../../core/constants/enums/gender_enum.dart';
import '../../../data/request/param/add_person_param.dart';
import '../../screen/add_person/add_person_screen.dart';

class AddPersonScreenNotifier extends ScreenNotifier {
  /// Constructors
  AddPersonScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final AddPersonScreenParam param;

  final addPersonCubit = PersonsCubit();

  final ValueNotifier<GenderEnum?> gender = ValueNotifier(null);

  DateTime? _dob;
  bool _isLoading = false;

  final ageController = TextEditingController();
  final nameController = TextEditingController();
  final positionController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final ageFocusNode = FocusNode();
  final nameFocusNode = FocusNode();
  final positionFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  final ageKey = GlobalKey<FormFieldState<String>>();
  final nameKey = GlobalKey<FormFieldState<String>>();
  final positionKey = GlobalKey<FormFieldState<String>>();
  final phoneNumberKey = GlobalKey<FormFieldState<String>>();

  final dobKey = GlobalKey<CustomListTileState>();

  /// Getters and Setters
  DateTime? get dob => _dob;
  set dob(DateTime? value) {
    _dob = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Methods
  void addPerson() {
    if (formKey.currentState!.validate()) {
      addPersonCubit.addPerson(
        AddPersonParam(
          age: int.tryParse(ageController.text),
          gender: getStringFromGender(gender.value),
          dob: _dob,
          name: nameController.text,
          phonenumber: phoneNumberController.text,
          position: positionController.text,
        ),
      );
    }
  }

  @override
  void closeNotifier() {
    addPersonCubit.close();
    ageFocusNode.dispose();
    nameFocusNode.dispose();
    positionFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    ageController.dispose();
    nameController.dispose();
    positionController.dispose();
    phoneNumberController.dispose();
    this.dispose();
  }
}
