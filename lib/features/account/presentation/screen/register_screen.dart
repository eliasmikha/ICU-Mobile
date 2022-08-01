import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:starter_application/core/common/app_colors.dart';

import 'package:starter_application/core/common/utils/utils.dart';
import 'package:starter_application/core/constants/enums/gender_enum.dart';
import 'package:starter_application/core/navigation/animations/animated_route.dart';
import 'package:starter_application/core/navigation/nav.dart';
import 'package:starter_application/core/ui/error_ui/error_viewer/error_viewer.dart';
import 'package:starter_application/core/ui/screens/base_screen.dart';
import 'package:starter_application/core/ui/widgets/custom_list_tile.dart';
import 'package:starter_application/core/ui/widgets/dropdown/custom_dropdown.dart';
import 'package:starter_application/features/account/presentation/screen/confirm_account/confirm_account_screen.dart';
import 'package:starter_application/generated/l10n.dart';

import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/theme/custom_theme_colors.dart';
import '../../../../core/ui/clippers/headline_clipper.dart';
import '../../../../core/ui/widgets/custom_button.dart';
import '../../../../core/ui/widgets/custom_text_field.dart';
import '../state_m/cubit/account_cubit.dart';

class RegisterScreenParam {}

class RegisterScreen extends BaseScreen<RegisterScreenParam> {
  static const routeName = "/RegisterScreen";

  RegisterScreen({required RegisterScreenParam param, Key? key})
      : super(param: param, key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _inAsyncCall = false;
  final cancelToken = CancelToken();
  final FocusNode myFocusNodeName = FocusNode();
  final FocusNode myFocusNodeUsername = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeConfirmPassword = FocusNode();
  final FocusNode myFocusNodePhoneNumber = FocusNode();

  // Key
  final _nameKey = GlobalKey<FormFieldState<String>>();
  final _usernameKey = GlobalKey<FormFieldState<String>>();
  final _emailKey = GlobalKey<FormFieldState<String>>();
  final _passwordKey = GlobalKey<FormFieldState<String>>();
  final _confirmPasswordKey = GlobalKey<FormFieldState<String>>();
  final _phoneNumberKey = GlobalKey<FormFieldState<String>>();
  final _formKey = GlobalKey<FormState>();

  // Controller
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  DateTime? _dateTime;
  bool? _confirmedPassword;
  final ValueNotifier<GenderEnum?> _genderValue = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: AppConstants.appbarHeight,
        backgroundColor: Colors.transparent,
        leading: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            padding: const EdgeInsets.all(10),
            color: Theme.of(context).colorScheme.primary,
            child: InkWell(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Theme.of(context).iconTheme.color,
              ),
              onTap: Nav.pop,
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: ModalProgressHUD(
          inAsyncCall: _inAsyncCall,
          child: BlocListener<AccountCubit, AccountState>(
            bloc: BlocProvider.of<AccountCubit>(context),
            listener: (context, state) {
              state.when(
                accountInit: () {},
                accountLoading: () {
                  setState(() {
                    _inAsyncCall = true;
                  });
                },
                loginLoaded: (_) {},
                registerLoaded: (s) {
                  setState(() {
                    _inAsyncCall = false;
                  });
                  Nav.off(
                    ConfirmAccountScreen.routeName,
                    arguments: ConfirmAccountScreenParam(
                      email: _emailController.text,
                    ),
                  );
                },
                accountError: (e, c) {
                  setState(() {
                    _inAsyncCall = false;
                  });
                  ErrorViewer.showError(
                    context: context,
                    error: e,
                    callback: c,
                  );
                },
                successLogout: () {},
              );
            },
            child: _buildScreen(),
          ),
        ),
      ),
    );
  }

  Widget _buildHeadline() {
    final themeData = Theme.of(context);
    return ClipPath(
      clipper: HeadlineClipper(),
      child: Container(
        width: 1.sw,
        height: .4.sh,
        color: themeData.colorScheme.primary,
        padding: EdgeInsetsDirectional.only(
          top: AppConstants.appbarHeight * 0.8,
          start: AppConstants.screenPadding.left,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create\nAccount',
              style: themeData.textTheme.headline2?.copyWith(
                color: themeData.extension<CustomThemeColors>()!.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            20.verticalSpace,
            Text(
              'Please Sign-up to continue!',
              style: themeData.textTheme.bodyMedium?.copyWith(
                color: themeData.extension<CustomThemeColors>()!.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreen() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildHeadline(),
            SlidingAnimated(
              initialOffsetX: 1,
              intervalStart: 0,
              intervalEnd: 0.1,
              child: Padding(
                padding: AppConstants.screenPadding,
                child: _buildNameField(),
              ),
            ),
            32.verticalSpace,
            SlidingAnimated(
              initialOffsetX: 1,
              intervalStart: 0.1,
              intervalEnd: 0.2,
              child: Padding(
                padding: AppConstants.screenPadding,
                child: _buildUserNameField(),
              ),
            ),
            32.verticalSpace,
            SlidingAnimated(
              initialOffsetX: 1,
              intervalStart: 0.2,
              intervalEnd: 0.3,
              child: Padding(
                padding: AppConstants.screenPadding,
                child: _buildEmailField(),
              ),
            ),
            32.verticalSpace,
            SlidingAnimated(
              initialOffsetX: 1,
              intervalStart: 0.3,
              intervalEnd: 0.4,
              child: Padding(
                padding: AppConstants.screenPadding,
                child: _buildPhoneField(),
              ),
            ),
            32.verticalSpace,
            SlidingAnimated(
              initialOffsetX: 1,
              intervalStart: 0.4,
              intervalEnd: 0.5,
              child: Padding(
                padding: AppConstants.screenPadding,
                child: _buildPasswordField(),
              ),
            ),
            32.verticalSpace,
            SlidingAnimated(
              initialOffsetX: 1,
              intervalStart: 0.5,
              intervalEnd: 0.6,
              child: Padding(
                padding: AppConstants.screenPadding,
                child: _buildConfirmPasswordField(),
              ),
            ),
            32.verticalSpace,
            SlidingAnimated(
              initialOffsetX: 1,
              intervalStart: 0.6,
              intervalEnd: 0.7,
              child: Padding(
                padding: AppConstants.screenPadding,
                child: _buildGenderDropdown(),
              ),
            ),
            32.verticalSpace,
            SlidingAnimated(
              initialOffsetX: 2,
              intervalStart: 0.7,
              intervalEnd: 1,
              child: Padding(
                padding: AppConstants.screenPadding,
                child: _buildDateOfBirth(),
              ),
            ),
            128.verticalSpace,
            SlidingAnimated(
              initialOffsetX: 2,
              intervalStart: 0.2,
              intervalEnd: 1,
              child: Padding(
                padding: AppConstants.screenPadding,
                child: CustomButton(
                  backgroundColor:
                      Theme.of(context).buttonTheme.colorScheme!.primary,
                  titleText: S.current.signUp,
                  textColor: Theme.of(context).textTheme.button?.color,
                  onPressed: () {
                    sendRequest();
                  },
                  fixedSize: Size(1.sw, 50),
                  borderRadius: const Radius.circular(100),
                ),
              ),
            ),
            128.verticalSpace,
          ],
        ),
      ),
    );
  }

  unFocus() {
    Utils.unFocus(context);
  }

  Widget _buildNameField() {
    return CustomTextField(
      textKey: _nameKey,
      controller: _nameController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: myFocusNodeName,
      labelText: S.current.firstName,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.current.errorEmptyField;
        } else
          return null;
      },
      onFieldSubmitted: (term) {
        myFocusNodeUsername.requestFocus();
      },
      onChanged: (value) {
        _nameKey.currentState!.validate();
      },
    );
  }

  Widget _buildUserNameField() {
    return CustomTextField(
      textKey: _usernameKey,
      controller: _usernameController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: myFocusNodeUsername,
      labelText: "Username",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.current.errorEmptyField;
        } else
          return null;
      },
      onFieldSubmitted: (term) {
        myFocusNodeEmail.requestFocus();
      },
      onChanged: (value) {
        _usernameKey.currentState!.validate();
      },
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      textKey: _emailKey,
      controller: _emailController,
      focusNode: myFocusNodeEmail,
      labelText: "Email",
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        _emailKey.currentState?.validate();
      },
      onFieldSubmitted: (_) {
        myFocusNodePhoneNumber.requestFocus();
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.current.errorEmptyField;
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildPhoneField() {
    return CustomTextField(
      textKey: _phoneNumberKey,
      controller: _phoneNumberController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      focusNode: myFocusNodePhoneNumber,
      labelText: S.current.phone,
      onFieldSubmitted: (term) {
        myFocusNodePassword.requestFocus();
      },
      onChanged: (value) {
        _emailKey.currentState!.validate();
      },
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      textKey: _passwordKey,
      controller: _passwordController,
      textInputAction: TextInputAction.go,
      keyboardType: TextInputType.text,
      focusNode: myFocusNodePassword,
      labelText: S.current.password,
      validator: (value) {
        if (value == null || value.length < 5) {
          return S.current.invalidPassword;
        } else
          return null;
      },
      onFieldSubmitted: (term) {
        myFocusNodeConfirmPassword.requestFocus();
      },
      onChanged: (val) {
        _passwordKey.currentState!.validate();
      },
      isPassword: true,
    );
  }

  Widget _buildConfirmPasswordField() {
    return CustomTextField(
      textKey: _confirmPasswordKey,
      controller: _confirmPasswordController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      focusNode: myFocusNodeConfirmPassword,
      labelText: S.current.confirmPassword,
      suffixIcon:
          _confirmedPassword == null ? null : _getConfirmPasswordSuffix(),
      validator: (value) {
        if (_passwordController.text.isEmpty) return null;
        if (_passwordController.text == value) {
          setState(() {
            _confirmedPassword = true;
          });
          return null;
        } else {
          setState(() {
            _confirmedPassword = false;
          });
          return S.current.invalidConfirmPassword;
        }
      },
      onFieldSubmitted: (term) {
        sendRequest();
      },
      onChanged: (value) {
        _confirmPasswordKey.currentState!.validate();
      },
      isPassword: true,
      isConfirmPassword: true,
    );
  }

  Widget _buildGenderDropdown() {
    return CustomDropdown<GenderEnum>(
      dropdownItems: GenderEnum.values,
      dropdownValue: _genderValue,
      stringTitleGetter: (object) {
        return getStringFromGender(object);
      },
      validator: (value) {
        if (value == null) {
          return S.current.errorEmptyField;
        } else {
          return null;
        }
      },
      border: border,
      errorBorder: errorBorder,
      focusedBorder: focusedBorder,
      contentPadding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 50.w,
      ),
      hint: Text(
        "Choose your gender",
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color:
                  Theme.of(context).extension<CustomThemeColors>()!.textColor,
            ),
      ),
    );
  }

  Widget _buildDateOfBirth() {
    return CustomListTile(
      padding: EdgeInsets.symmetric(
        vertical: 40.h,
        horizontal: 50.w,
      ),
      border: Border.all(
        color: _dateTime == null ? AppColors.grey500 : AppColors.blue500,
        width: 2,
      ),
      borderRadius: BorderRadius.zero,
      title: Text(
        _dateTime == null
            ? "Date of birth"
            : DateFormat('dd / MMM / yyyy').format(_dateTime!),
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color:
                  Theme.of(context).extension<CustomThemeColors>()!.textColor,
            ),
      ),
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: _dateTime ?? DateTime(2000, 1, 1),
          firstDate: DateTime(1920, 1, 1),
          lastDate: DateTime(2005, 1, 1),
          initialDatePickerMode: DatePickerMode.day,
          initialEntryMode: DatePickerEntryMode.calendarOnly,
        );

        setState(() {
          _dateTime = picked ?? _dateTime;
        });
      },
      trailing: Icon(
        Icons.arrow_drop_down,
        color: Colors.grey.shade700,
      ),
      trailingFlex: 1,
    );
  }

  OutlineInputBorder get border => const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: AppColors.grey500,
          width: 2,
        ),
      );

  OutlineInputBorder get errorBorder => const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: Colors.red,
          width: 1,
        ),
      );

  OutlineInputBorder get focusedBorder => const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: AppColors.blue500,
          width: 2,
        ),
      );

  Widget _getConfirmPasswordSuffix() {
    return _confirmedPassword == true
        ? Icon(
            Icons.check_circle_rounded,
            color: Colors.green.shade700,
          )
        : Icon(
            Icons.cancel_rounded,
            color: Colors.red.shade700,
          );
  }

  void sendRequest() {
    // unFocus();

    // if (_formKey.currentState!.validate()) {
    //   BlocProvider.of<AccountCubit>(context).register(
    //     RegisterRequest(
    //       name: _nameController.text,
    //       username: _usernameController.text,
    //       phonenumber: _phoneNumberController.text,
    //       email: _emailController.text,
    //       password: _passwordController.text,
    //       dob: _dateTime?.toIso8601String(),
    //       gender: mapGenderToInt(_genderValue.value),
    //       cancelToken: cancelToken,
    //     ),
    //   );
    // }
    Nav.off(
      ConfirmAccountScreen.routeName,
      arguments: ConfirmAccountScreenParam(
        email: _emailController.text,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    cancelToken.cancel();
    myFocusNodeName.dispose();
    myFocusNodeUsername.dispose();
    myFocusNodeEmail.dispose();
    myFocusNodePassword.dispose();
    myFocusNodeConfirmPassword.dispose();
    myFocusNodePhoneNumber.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
  }
}
