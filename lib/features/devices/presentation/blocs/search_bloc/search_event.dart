part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchForDeviceEvent extends SearchEvent {
  final String searchText;

  const SearchForDeviceEvent({
    required this.searchText,
  });

  @override
  List<Object?> get props => [searchText];
}
