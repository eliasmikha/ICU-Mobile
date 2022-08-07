part of 'persons_cubit.dart';

@freezed
class PersonsState with _$PersonsState {
  const factory PersonsState.personsInit() = PersonsInitState;

  const factory PersonsState.personsLoading() = PersonsLoadingState;

  const factory PersonsState.personsError(
    AppErrors error,
    VoidCallback callback,
  ) = PersonsErrorState;

	const factory PersonsState.successAddPerson() = SuccessAddPersonState;

	const factory PersonsState.personsListLoaded(
		PersonsListEntity personsEntity,
	) = PersonsListLoadedState;
}
