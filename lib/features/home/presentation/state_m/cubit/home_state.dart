part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.homeInitState() = HomeInitState;

  const factory HomeState.homeLoadingState() = HomeLoadingState;

  const factory HomeState.homeLoadedState(EmptyResponse emptyResponse) =
      HomeLoadedState;

  const factory HomeState.homeErrorState(
    AppErrors error,
    VoidCallback callback,
  ) = HomeErrorInitState;

  const factory HomeState.peopleListLoadedState(PeopleDataEntity data) =
      PeopleListLoadedState;

  const factory HomeState.commentsLoadedState(List<CommentsEntity> comments) =
  CommentsLoadedState;
}

