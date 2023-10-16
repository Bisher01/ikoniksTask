import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/device_entity.dart';
import '../../domain/usecases/fetch_devices.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceListEvent, DeviceListState> {
  final FetchDevices fetchDevicesUseCase;
  DeviceBloc({required this.fetchDevicesUseCase})
      : super(const DeviceListState()) {
    on<DeviceListEvent>((event, emitter) async {
      if (event is DeviceListFailedFetchRetried) {
        await _handleDeviceListFailedFetchRetried(emitter);
      } else if (event is DeviceListRefreshed) {
        await _handleDeviceListRefreshed(emitter, event);
      } else if (event is DeviceListNextPageRequested) {
        await _handleDeviceListNextPageRequested(emitter, event);
      }
    });
  }

  Future<void> _handleDeviceListFailedFetchRetried(Emitter emitter) {
    // Clears out the error and puts the loading indicator back on the screen.
    emitter(
      state.copyWithNewError(null),
    );
    final firstPageFetchStream = _fetchDevicePage(
      0,
    );

    return emitter.onEach<DeviceListState>(
      firstPageFetchStream,
      onData: emitter,
    );
  }

  Future<void> _handleDeviceListRefreshed(
    Emitter emitter,
    DeviceListRefreshed event,
  ) {
    final firstPageFetchStream = _fetchDevicePage(
      0,
      isRefresh: true,
    );

    return emitter.onEach<DeviceListState>(
      firstPageFetchStream,
      onData: emitter,
    );
  }

  Future<void> _handleDeviceListNextPageRequested(
    Emitter emitter,
    DeviceListNextPageRequested event,
  ) {
    emitter(
      state.copyWithNewError(null),
    );

    final nextPageFetchStream = _fetchDevicePage(
      event.pageNumber,
    );

    return emitter.onEach<DeviceListState>(
      nextPageFetchStream,
      onData: emitter,
    );
  }

  Stream<DeviceListState> _fetchDevicePage(
    int page, {
    bool isRefresh = false,
  }) async* {
    final response = await fetchDevicesUseCase(
      params: page,
    );
    DeviceListEntity? data;
    response.fold((l)  {
      print(l.properties[0]);
    }, (r) {
      data = r;
    });
    try {
      final newPage = data!;
      final newItemList = newPage.results;
      final oldItemList = state.itemList ?? [];
      final completeItemList =
      isRefresh || page == 0 ? newItemList : (oldItemList + newItemList);
      final nextPage = newPage.skip == null ? null : page+20;
      yield DeviceListState.success(
        nextPage: nextPage,
        itemList: completeItemList,
        isRefresh: isRefresh,
      );
    } catch (error) {
      if (isRefresh) {
        yield state.copyWithNewRefreshError(
          error,
        );
      } else {
        yield state.copyWithNewError(
          error,
        );
      }
    }

  }
}
