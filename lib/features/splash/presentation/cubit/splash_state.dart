part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = InitialState;

  const factory SplashState.loading() = LoadingState;

  const factory SplashState.error({
    required AppErrors error,
    required VoidCallback callback,
  }) = ErrorState;

  const factory SplashState.loaded(SplashEntity splashEntity) = LoadedState;
}
