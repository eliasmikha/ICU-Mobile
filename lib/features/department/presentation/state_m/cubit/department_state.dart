part of 'department_cubit.dart';

@freezed
class DepartmentState with _$DepartmentState {
  const factory DepartmentState.departmentInit() = DepartmentInitState;

  const factory DepartmentState.departmentLoading() = DepartmentLoadingState;

  const factory DepartmentState.departmentError(
    AppErrors error,
    VoidCallback callback,
  ) = DepartmentErrorState;
}
