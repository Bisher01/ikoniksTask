part of 'device_bloc.dart';

class DeviceListState extends Equatable {
  const DeviceListState({
    this.itemList,
    this.nextPage,
    this.error,
    this.refreshError,
  });

  /// Holds all of the items from the pages you have loaded so far.
  final List<DeviceEntity>? itemList;

  /// The next page to be fetched, or `null` if you have already loaded the entire list.
  ///
  /// Besides determining which page should be asked next, it also determines
  /// whether you need a loading indicator at the bottom to indicate you haven't
  /// fetched all pages yet.
  final int? nextPage;

  /// Indicates an error occurred trying to fetch any page of quotes.
  ///
  /// If both this property and [itemList] holds values, that means the error
  /// occurred trying to fetch a subsequent page. If, on the other hand, this
  /// property has a value but [itemList] doesn't, that means the error occurred
  /// when fetching the first page.
  final dynamic error;


  /// Indicates an error occurred trying to refresh the list.
  ///
  /// Used to display a toast to indicate the failure.
  final dynamic refreshError;


  /// Auxiliary constructor that facilitates building the state for when the app
  /// couldn't find any items for the selected filter.
  const DeviceListState.noItemsFound() : this(
    itemList: const [],
    error: null,
    nextPage: 1,
  );

  /// Auxiliary constructor that facilitates building the state for when the app
  /// has successfully loaded a new page.
  const DeviceListState.success({
    required int? nextPage,
    required List<DeviceEntity> itemList,
    required bool isRefresh,
  }) : this(
    nextPage: nextPage,
    itemList: itemList,
  );

  /// Auxiliary function that creates a copy of the current state with a new
  /// value for the [error] property.
  DeviceListState copyWithNewError(
      dynamic error,
      ) =>
      DeviceListState(
        itemList: itemList,
        nextPage: nextPage,
        error: error,
        refreshError: null,
      );

  /// Auxiliary function that creates a copy of the current state with a new
  /// value for the [refreshError] property.
  DeviceListState copyWithNewRefreshError(
      dynamic refreshError,
      ) =>
      DeviceListState(
        itemList: itemList,
        nextPage: nextPage,
        error: error,
        refreshError: refreshError,
      );


  @override
  List<Object?> get props => [
    itemList,
    nextPage,
    error,
    refreshError,
  ];
}
