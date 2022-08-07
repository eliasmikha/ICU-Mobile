part of 'branch_cubit.dart';

@freezed
class BranchState with _$BranchState {
  const factory BranchState.branchInit() = BranchInitState;

  const factory BranchState.branchLoading() = BranchLoadingState;

  const factory BranchState.branchError(
    AppErrors error,
    VoidCallback callback,
  ) = BranchErrorState;

	const factory BranchState.branchListLoaded(
		BranchListEntity branchEntity,
	) = BranchListLoadedState;
}
