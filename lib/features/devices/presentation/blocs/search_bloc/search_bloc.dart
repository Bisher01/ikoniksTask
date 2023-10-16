import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/devices/domain/entities/device_entity.dart';

import '../../../domain/usecases/search_devices.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchDevices searchDevices;

  SearchBloc({
    required this.searchDevices,
  }) : super(SearchLoadingState()) {
    on<SearchEvent>((event, emit) async {
      if (event is SearchForDeviceEvent) {
        emit(SearchLoadingState());
        final result = await searchDevices.call(params: event.searchText);
        result.fold((l) => emit(SearchErrorState(message: l.properties[0])),
            (r) => emit(SearchLoadedState(devices: r)));
      }
    });
  }
}
