import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:starter_application/core/common/app_colors.dart';

import 'package:starter_application/core/common/utils/utils.dart';
import 'package:starter_application/core/common/validators.dart';
import 'package:starter_application/core/navigation/animations/animated_route.dart';
import 'package:starter_application/core/navigation/nav.dart';
import 'package:starter_application/core/ui/error_ui/error_viewer/error_viewer.dart';
import 'package:starter_application/core/ui/screens/base_screen.dart';
import 'package:starter_application/features/account/data/model/request/register_request.dart';
import 'package:starter_application/features/home/presentation/screen/app_main_screen/app_main_screen.dart';
import 'package:starter_application/generated/l10n.dart';

import '../../../../core/ui/widgets/custom_button.dart';
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
  final FocusNode myFocusNodeLastName = FocusNode();
  final FocusNode myFocusNodePhoneOrEmail = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeConfirmPassword = FocusNode();

  bool _passwordSecure = true;
  bool _confirmPasswordSecure = true;

  // Key
  final _nameKey = new GlobalKey<FormFieldState<String>>();
  final _lastNameKey = new GlobalKey<FormFieldState<String>>();
  final _phoneOrEmailKey = new GlobalKey<FormFieldState<String>>();
  final _passwordKey = new GlobalKey<FormFieldState<String>>();
  final _confirmPasswordKey = new GlobalKey<FormFieldState<String>>();

  // Controller
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneOrEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool turnPhoneOrEmailValidate = true;

  bool turnPasswordValidate = true;

  bool turnLastNameValidate = true;

  bool turnNameValidate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(S.current.signUp),
      ),
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
                    AppMainScreen.routeName,
                    arguments: AppMainScreenParam(),
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

  Widget _buildScreen() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 32,
          ),
          child: Column(
            children: <Widget>[
              SlidingAnimated(
                initialOffsetX: 1,
                intervalStart: 0,
                intervalEnd: 0.1,
                child: _buildNameField(),
              ),
              32.verticalSpace,
              SlidingAnimated(
                initialOffsetX: 1,
                intervalStart: 0.1,
                intervalEnd: 0.2,
                child: _buildLastNameField(),
              ),
              32.verticalSpace,
              SlidingAnimated(
                initialOffsetX: 1,
                intervalStart: 0.2,
                intervalEnd: 0.4,
                child: _buildPhoneField(),
              ),
              32.verticalSpace,
              SlidingAnimated(
                initialOffsetX: 1,
                intervalStart: 0.4,
                intervalEnd: 0.6,
                child: _buildPasswordField(),
              ),
              32.verticalSpace,
              SlidingAnimated(
                initialOffsetX: 1,
                intervalStart: 0.6,
                intervalEnd: 0.8,
                child: _buildConfirmPasswordField(),
              ),
              128.verticalSpace,
              SlidingAnimated(
                initialOffsetX: 2,
                intervalStart: 0.2,
                intervalEnd: 1,
                child: CustomButton(
                  backgroundColor: Colors.green,
                  titleText: S.current.signUp,
                  textColor: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    sendRequest();
                  },
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  unFocus() {
    Utils.unFocus(context);
  }

  Widget _buildNameField() {
    return TextFormField(
      key: _nameKey,
      controller: _nameController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: myFocusNodeName,
      decoration: InputDecoration(
        fillColor: AppColors.accentColorLight,
        labelText: S.current.firstName,
      ),
      validator: (value) {
        if (turnNameValidate) {
          if (Validators.isValidName(value!))
            return null;
          else
            return S.current.errorEmptyField;
        } else
          return null;
      },
      onFieldSubmitted: (term) {
        myFocusNodeLastName.requestFocus();
      },
      onChanged: (value) {
        if (turnNameValidate) {
          setState(() {
            turnNameValidate = false;
          });
          _nameKey.currentState!.validate();
        }
      },
    );
  }

  Widget _buildLastNameField() {
    return TextFormField(
      key: _lastNameKey,
      controller: _lastNameController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: myFocusNodeLastName,
      decoration: InputDecoration(
        fillColor: AppColors.accentColorLight,
        labelText: S.current.lastName,
      ),
      validator: (value) {
        if (turnLastNameValidate) {
          if (Validators.isValidName(value!))
            return null;
          else
            return S.current.errorEmptyField;
        } else
          return null;
      },
      onFieldSubmitted: (term) {
        myFocusNodePhoneOrEmail.requestFocus();
      },
      onChanged: (value) {
        if (turnLastNameValidate) {
          setState(() {
            turnLastNameValidate = false;
          });
          _lastNameKey.currentState!.validate();
        }
      },
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      key: _phoneOrEmailKey,
      controller: _phoneOrEmailController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      focusNode: myFocusNodePhoneOrEmail,
      decoration: InputDecoration(
        helperText: "09X-XXX-XXXX",
        labelText: S.current.phone,
        fillColor: AppColors.accentColorLight,
      ),
      validator: (value) {
        if (turnPhoneOrEmailValidate) {
          if (Validators.isValidPhoneNumber(value!))
            return null;
          else
            return S.current.invalidPhoneNumber;
        } else
          return null;
      },
      onFieldSubmitted: (term) {
        myFocusNodePassword.requestFocus();
      },
      onChanged: (value) {
        if (turnPhoneOrEmailValidate) {
          setState(() {
            turnPhoneOrEmailValidate = false;
          });
          _phoneOrEmailKey.currentState!.validate();
        }
      },
    );
  }

  // _buildEmailField() {
  //   return MyTextFormField(
  //     color: AppColors.accentColorLight,
  //     formKey: _phoneOrEmailKey,
  //     controller: _phoneOrEmailController,
  //     textInputAction: TextInputAction.next,
  //     keyboardType: TextInputType.emailAddress,
  //     focusNode: myFocusNodePhoneOrEmail,
  //     labelText: S.current.label_email,
  //     validator: (value) {
  //       if (turnPhoneOrEmailValidate) {
  //         if (Validators.isValidEmail(value!))
  //           return null;
  //         else
  //           return S.current.error_inValid_email;
  //       } else
  //         return null;
  //     },
  //     onFieldSubmitted: (term) {
  //       fieldFocusChange(context, myFocusNodePhoneOrEmail, myFocusNodePassword);
  //     },
  //     onChanged: (value) {
  //       if (turnPhoneOrEmailValidate) {
  //         setState(() {
  //           turnPhoneOrEmailValidate = false;
  //         });
  //         _phoneOrEmailKey.currentState!.validate();
  //       }
  //     },
  //   );
  // }

  Widget _buildPasswordField() {
    return TextFormField(
      key: _passwordKey,
      controller: _passwordController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      focusNode: myFocusNodePassword,
      decoration: InputDecoration(
        labelText: S.current.password,
        fillColor: AppColors.accentColorLight,
        suffixIcon: IconButton(
            icon: Icon(
              _passwordSecure ? Icons.visibility : Icons.visibility_off,
              color: AppColors.accentColorLight,
            ),
            onPressed: () {
              setState(() {
                _passwordSecure = !_passwordSecure;
              });
            }),
      ),
      onFieldSubmitted: (term) {
        myFocusNodeConfirmPassword.requestFocus();
      },
      validator: (value) {
        if (turnPasswordValidate) {
          if (Validators.isValidPassword(value!))
            return null;
          else
            return S.current.invalidPassword;
        } else
          return null;
      },
      onChanged: (val) {
        if (turnPasswordValidate) {
          setState(() {
            turnPasswordValidate = false;
          });
          _passwordKey.currentState!.validate();
        }
      },
      obscureText: _passwordSecure,
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      key: _confirmPasswordKey,
      controller: _confirmPasswordController,
      textInputAction: TextInputAction.go,
      keyboardType: TextInputType.visiblePassword,
      focusNode: myFocusNodeConfirmPassword,
      decoration: InputDecoration(
        fillColor: AppColors.accentColorLight,
        labelText: S.current.confirmPassword,
        suffixIcon: IconButton(
            icon: Icon(
              _confirmPasswordSecure ? Icons.visibility : Icons.visibility_off,
              color: AppColors.accentColorLight,
            ),
            onPressed: () {
              setState(() {
                _confirmPasswordSecure = !_confirmPasswordSecure;
              });
            }),
      ),
      validator: (value) {
        if (_passwordController.text == value)
          return null;
        else
          return S.current.invalidConfirmPassword;
      },
      onFieldSubmitted: (term) {
        sendRequest();
      },
      onChanged: (value) {
        _passwordKey.currentState!.validate();
      },
      obscureText: _confirmPasswordSecure,
    );
  }

  void sendRequest() {
    unFocus();
    setState(() {
      turnPhoneOrEmailValidate = true;

      turnPasswordValidate = true;

      turnLastNameValidate = true;

      turnNameValidate = true;
    });

    if (_nameKey.currentState!.validate()) {
      if (_lastNameKey.currentState!.validate()) {
        if (_phoneOrEmailKey.currentState!.validate()) {
          if (_passwordKey.currentState!.validate()) {
            if (_confirmPasswordKey.currentState!.validate()) {
              BlocProvider.of<AccountCubit>(context).register(
                RegisterRequest(
                  firstName: _nameController.text,
                  lastName: _lastNameController.text,
                  phoneNumber: _phoneOrEmailController.text
                      .replaceAll(RegExp("[^0-9]"), ""),
                  email: _phoneOrEmailController.text,
                  password: _passwordController.text,
                  cancelToken: cancelToken,
                ),
              );
            }
          }
        }
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    cancelToken.cancel();
    myFocusNodeName.dispose();
    myFocusNodeLastName.dispose();
    myFocusNodePhoneOrEmail.dispose();
    myFocusNodePassword.dispose();
    myFocusNodeConfirmPassword.dispose();
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneOrEmailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }
}
