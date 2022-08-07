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
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/navigation/nav.dart';
import 'package:starter_application/core/theme/custom_theme_colors.dart';
import 'package:starter_application/core/ui/clippers/headline_clipper.dart';
import 'package:starter_application/core/ui/error_ui/error_viewer/error_viewer.dart';
import 'package:starter_application/core/ui/screens/base_screen.dart';
import 'package:starter_application/core/ui/widgets/custom_text_field.dart';
import 'package:starter_application/features/account/data/model/request/login_request.dart';
import 'package:starter_application/features/account/presentation/screen/register_screen.dart';
import 'package:starter_application/features/account/presentation/state_m/provider/profile_notifier.dart';
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

  final _phoneOrEmailKey = GlobalKey<FormFieldState<String>>();
  final _passwordKey = GlobalKey<FormFieldState<String>>();
  final _formKey = GlobalKey<FormState>();

  final _phoneOrEmailController = TextEditingController(text: "yassar");
  final _passwordController = TextEditingController(text: "yassar");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ModalProgressHUD(
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
              loginLoaded: (s) async {
                await LocalStorage.persistToken(s.token);
                await context.read<ProfileNotifier>().setProfileInfo(
                      profile: s.user,
                    );
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
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Form(
      key: _formKey,
      child: Container(
        height: 1.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeadline(),
              Padding(
                padding: AppConstants.screenPadding,
                child: _buildEmailField(),
              ),
              40.verticalSpace,
              Padding(
                padding: AppConstants.screenPadding,
                child: _buildPasswordField(),
              ),
              64.verticalSpace,
              _buildButtons(),
              40.verticalSpace,
            ],
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
              'Welcome\nBack',
              style: themeData.textTheme.headline2?.copyWith(
                color: themeData.extension<CustomThemeColors>()!.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            20.verticalSpace,
            Text(
              'Please Sign-in to continue!',
              style: themeData.textTheme.bodyMedium?.copyWith(
                color: themeData.extension<CustomThemeColors>()!.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void unFocus() {
    Utils.unFocus(context);
  }

  void sendRequest() {
    unFocus();
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AccountCubit>(context).login(
        LoginRequest(
          username: _phoneOrEmailController.text,
          password: _passwordController.text,
          cancelToken: cancelToken,
        ),
      );
    }
  }

  Widget _buildEmailField() {
    return CustomTextField(
      textKey: _phoneOrEmailKey,
      controller: _phoneOrEmailController,
      focusNode: myFocusNodeUserName,
      labelText: "Email",
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        _phoneOrEmailKey.currentState?.validate();
      },
      onFieldSubmitted: (_) {
        myFocusNodePassword.requestFocus();
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "required field! mustn't be empty";
        } else {
          return null;
        }
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
        sendRequest();
      },
      onChanged: (val) {
        _passwordKey.currentState!.validate();
      },
      isPassword: true,
    );
  }

  Widget _buildButtons() {
    final themeData = Theme.of(context);
    return Padding(
      padding: AppConstants.screenPadding,
      child: Column(
        children: [
          CustomButton(
            backgroundColor: themeData.buttonTheme.colorScheme!.primary,
            titleText: S.current.login,
            textColor: themeData.textTheme.button?.color,
            onPressed: () {
              sendRequest();
              // Nav.off(
              //   AppMainScreen.routeName,
              //   arguments: AppMainScreenParam(),
              // );
            },
            fixedSize: Size(1.sw, 50),
            borderRadius: const Radius.circular(100),
          ),
          32.verticalSpace,
          Text(
            "Don't have an account?",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: themeData.textTheme.bodyText1?.color,
                ),
          ),
          // 32.verticalSpace,
          CustomButton(
            backgroundColor: Colors.transparent,
            titleText: S.current.signUp,
            textStyle: themeData.textTheme.button?.copyWith(
              color: themeData.colorScheme.secondary,
            ),
            onPressed: () {
              unFocus();
              Nav.to(RegisterScreen.routeName,
                  arguments: RegisterScreenParam());
            },
          ),
        ],
      ),
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
