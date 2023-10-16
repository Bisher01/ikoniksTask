import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:task/features/devices/presentation/pages/device_details_screen.dart';

import '../../../../core/const/style.dart';
import '../../../../core/widgets/exception_indicator.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../domain/entities/device_entity.dart';
import '../blocs/device_bloc.dart';
import '../widgets/device_card.dart';

class DeviceListScreen extends StatefulWidget {
  static const routeName = 'device_list';

  const DeviceListScreen({super.key});

  @override
  State<DeviceListScreen> createState() => _DeviceListScreenState();
}

class _DeviceListScreenState extends State<DeviceListScreen> {
  final PagingController<int, DeviceEntity> _pagingController =
      PagingController(
    firstPageKey: 0,
  );

  DeviceBloc get _bloc => context.read<DeviceBloc>();

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageNumber) {
      final isSubsequentPage = pageNumber >= 0;
      if (isSubsequentPage) {
        _bloc.add(
          DeviceListNextPageRequested(
            pageNumber: pageNumber,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeviceBloc, DeviceListState>(
      listener: (context, state) {
        _pagingController.value = state.toPagingState();
      },
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: const Text('Devices'),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            _bloc.add(
              const DeviceListRefreshed(),
            );
            final stateChangeFuture = _bloc.stream.first;
            return stateChangeFuture;
          },
          child: PagedListView.separated(
            pagingController: _pagingController,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 27),
            builderDelegate: PagedChildBuilderDelegate<DeviceEntity>(
              firstPageProgressIndicatorBuilder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppStyle.primaryColor,
                ),
              ),
              itemBuilder: (context, device, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        DeviceDetailsScreen.routeName,
                        arguments: {'device': device});
                  },
                  child: DeviceCard(
                    name: device.title,
                    image: device.thumbnail,
                  ),
                );
              },
              firstPageErrorIndicatorBuilder: (context) {
                return ExceptionIndicator(
                  onTryAgain: () {
                    _bloc.add(
                      const DeviceListFailedFetchRetried(),
                    );
                  },
                );
              },
              newPageProgressIndicatorBuilder: (context) => ShimmerWidget(
                height: 138,
                width: MediaQuery.of(context).size.width,
                borderRadiusGeometry:
                    const BorderRadius.all(Radius.circular(14)),
              ),
            ),
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 27,
              );
            },
          ),
        ),
      ),
    );
  }
}

extension on DeviceListState {
  PagingState<int, DeviceEntity> toPagingState() {
    return PagingState(
      itemList: itemList,
      nextPageKey: nextPage,
      error: error,
    );
  }
}
