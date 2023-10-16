part of 'device_bloc.dart';

abstract class DeviceListEvent extends Equatable {
  const DeviceListEvent();

  @override
  List<Object?> get props => [];
}

class DeviceListRefreshed extends DeviceListEvent {
  const DeviceListRefreshed();
}

class DeviceListNextPageRequested extends DeviceListEvent {
  const DeviceListNextPageRequested({
    required this.pageNumber,
  });
  final int pageNumber;
}

class DeviceListFailedFetchRetried extends DeviceListEvent {
  const DeviceListFailedFetchRetried();
}
