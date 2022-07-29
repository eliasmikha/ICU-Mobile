import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:starter_application/core/common/app_colors.dart';
import 'package:starter_application/core/common/local_storage.dart';
import 'package:starter_application/core/common/responsive/responsive_utils.dart';

import 'package:starter_application/core/common/utils/utils.dart';
import 'package:starter_application/core/common/validators.dart';
import 'package:starter_application/core/navigation/nav.dart';
import 'package:starter_application/core/ui/error_ui/error_viewer/error_viewer.dart';
import 'package:starter_application/core/ui/screens/base_screen.dart';
import 'package:starter_application/features/account/data/model/request/login_request.dart';
import 'package:starter_application/features/account/presentation/screen/register_screen.dart';
import 'package:starter_application/features/home/presentation/screen/app_main_screen/app_main_screen.dart';
import 'package:starter_application/generated/l10n.dart';

import '../../../../core/ui/widgets/custom_button.dart';
import '../state_m/cubit/account_cubit.dart';

class LoginScreenParam {}

class LoginScreen extends BaseScreen<LoginScreenParam> {
  static const routeName = "/LoginScreen";

  LoginScreen({required LoginScreenParam param, Key? key})
      : super(param: param, key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _inAsyncCall = false;
  final FocusNode myFocusNodeUserName = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();

  final cancelToken = CancelToken();

  bool _passwordSecure = true;

  final _phoneOrEmailKey = new GlobalKey<FormFieldState<String>>();
  final _passwordKey = new GlobalKey<FormFieldState<String>>();
  final _phoneOrEmailController = TextEditingController(text: "elias");
  final _passwordController = TextEditingController(text: "string");

  bool turnPhoneOrEmailValidate = true;

  bool turnPasswordValidate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: _inAsyncCall,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
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
                loginLoaded: (s) async {
                  await LocalStorage.persistToken(s.token);
                  setState(() {
                    _inAsyncCall = false;
                  });
                  Nav.off(
                    AppMainScreen.routeName,
                    arguments: AppMainScreenParam(),
                  );
                },
                registerLoaded: (_) {},
                accountError: (error, callback) {
                  setState(() {
                    _inAsyncCall = false;
                  });
                  return ErrorViewer.showError(
                    context: context,
                    error: error,
                    callback: callback,
                  );
                },
                successLogout: () {},
              );
            },
            child: Container(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              child: getValueForOrientation(
                context,
                portrait: _buildPortrait(),
                landscape: _buildLandscape(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPortrait() {
    return Container(
      height: ScreenUtil().screenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          64.verticalSpace,
          Text(
            S.current.welcome,
            style: Theme.of(context).textTheme.bodyText1!,
          ),
          64.verticalSpace,
          _buildPhoneNumberField(),
          32.verticalSpace,
          _buildPasswordField(),
          64.verticalSpace,
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildLandscape() {
    return Row(
      children: [
        Container(
          width: ScreenUtil().screenWidth * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.current.welcome,
                style: Theme.of(context).textTheme.bodyText1!,
              ),
              32.verticalSpace,
              _buildPhoneNumberField(),
              32.verticalSpace,
              _buildPasswordField(),
            ],
          ),
        ),
        32.horizontalSpace,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            64.verticalSpace,
            CustomButton(
              backgroundColor: Colors.green,
              titleText: S.current.login,
              textColor: Colors.black,
              onPressed: () {
                sendRequest();
              },
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
            ),
            12.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  S.current.or,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ],
            ),
            32.verticalSpace,
            CustomButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              titleText: S.current.signUp,
              textColor: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                unFocus();
                Nav.to(RegisterScreen.routeName,
                    arguments: RegisterScreenParam());
              },
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }

  unFocus() {
    Utils.unFocus(context);
  }

  void sendRequest() {
    unFocus();
    setState(() {
      turnPhoneOrEmailValidate = true;
      turnPasswordValidate = true;
    });
    if (_phoneOrEmailKey.currentState!.validate()) {
      if (_passwordKey.currentState!.validate()) {
        BlocProvider.of<AccountCubit>(context).login(
          LoginRequest(
            username: _phoneOrEmailController.text,
            password: _passwordController.text,
            cancelToken: cancelToken,
          ),
        );
      }
    }
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
      key: _phoneOrEmailKey,
      controller: _phoneOrEmailController,
      textInputAction: TextInputAction.next,
      focusNode: myFocusNodeUserName,
      decoration: InputDecoration(
        labelText: S.current.userName,
        helperText: "09X-XXX-XXXX",
      ),
      // validator: (value) {
      //   if (turnPhoneOrEmailValidate) {
      //     if (Validators.isValidPhoneNumber(value!))
      //       return null;
      //     else
      //       return S.current.invalidPhoneNumber;
      //   } else
      //     return null;
      // },
      onFieldSubmitted: (term) {
        myFocusNodePassword.requestFocus();
      },
      onChanged: (val) {
        if (turnPhoneOrEmailValidate) {
          setState(() {
            turnPhoneOrEmailValidate = false;
          });
          _phoneOrEmailKey.currentState!.validate();
        }
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      key: _passwordKey,
      controller: _passwordController,
      textInputAction: TextInputAction.go,
      keyboardType: TextInputType.text,
      focusNode: myFocusNodePassword,
      decoration: InputDecoration(
        labelText: S.current.password,
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
      validator: (value) {
        if (turnPasswordValidate) {
          if (Validators.isValidPassword(value!))
            return null;
          else
            return S.current.invalidPassword;
        } else
          return null;
      },
      onFieldSubmitted: (term) {
        sendRequest();
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

  Widget _buildButtons() {
    return Column(
      children: [
        CustomButton(
          backgroundColor: Colors.green,
          titleText: S.current.login,
          textColor: Colors.black,
          onPressed: () {
            sendRequest();
          },
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
        ),
        32.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.current.or,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ],
        ),
        32.verticalSpace,
        CustomButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          titleText: S.current.signUp,
          textColor: Colors.black,
          onPressed: () {
            unFocus();
            Nav.to(RegisterScreen.routeName, arguments: RegisterScreenParam());
          },
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    cancelToken.cancel();
    _phoneOrEmailController.dispose();
    _passwordController.dispose();
    myFocusNodeUserName.dispose();
    myFocusNodePassword.dispose();
  }
}
