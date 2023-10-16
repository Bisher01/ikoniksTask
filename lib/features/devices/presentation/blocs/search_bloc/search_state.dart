part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitialState extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoadingState extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchErrorState extends SearchState {
  final String message;

  const SearchErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class SearchLoadedState extends SearchState {
  final DeviceListEntity devices;

  const SearchLoadedState({required this.devices});

  @override
  List<Object> get props => [devices];
}
