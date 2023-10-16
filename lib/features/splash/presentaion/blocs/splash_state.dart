part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();
}

class SplashInitialState extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashLoadingState extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashSuccessState extends SplashState {
  @override
  List<Object?> get props => [];
}
