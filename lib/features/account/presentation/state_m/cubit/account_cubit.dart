import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starter_application/core/common/local_storage.dart';
import 'package:starter_application/core/common/utils/cubit_utils.dart';
import 'package:starter_application/core/constants/shared_preference/shared_preference_keys.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/models/empty_response.dart';
import 'package:starter_application/core/results/result.dart';
import 'package:starter_application/di/service_locator.dart';
import 'package:starter_application/features/account/data/model/request/login_request.dart';
import 'package:starter_application/features/account/data/model/request/register_request.dart';
import 'package:starter_application/features/account/domain/entity/login_entity.dart';
import 'package:starter_application/features/account/domain/entity/register_entity.dart';
import 'package:starter_application/features/account/domain/usecase/login_usecase.dart';
import 'package:starter_application/features/account/domain/usecase/register_usecase.dart';

part 'account_state.dart';

part 'account_cubit.freezed.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(const AccountState.accountInit());

  void login(LoginRequest body) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<LoginUseCase>()(body);

    result.pick(
      onData: (data) {
        emit(AccountState.loginLoaded(result.data!));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => this.login(body)));
      },
    );
  }

  void register(RegisterRequest body) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<RegisterUseCase>()(body);

    result.pick(
      onData: (data) {
        emit(AccountState.registerLoaded(result.data!));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => this.register(body)));
      },
    );
  }

  void logout() async {
    emit(const AccountState.accountLoading());

    for (String key in SharedPreferenceKeys.REMOVE_KEYS_ON_LOGOUT) {
      bool success = await LocalStorage.sharedPreferences.remove(key);
      if (success) debugPrint("$key removed");
    }

    // Todo: remove this line
    await Future.delayed(const Duration(seconds: 1));

    final List<Result> results = await Future.wait([]);
    final error = CubitUtils.checkError(results);

    if (error != null) {
      emit(AccountState.accountError(error, () => this.logout()));
    } else {
      emit(const AccountState.successLogout());
    }
  }
}
