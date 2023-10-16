import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/devices/domain/entities/device_entity.dart';
import 'package:task/features/devices/presentation/blocs/search_bloc/search_bloc.dart';

import '../../../../core/widgets/exception_indicator.dart';
import '../widgets/device_card.dart';
import 'device_details_screen.dart';

class SearchDevicesScreen extends StatefulWidget {
  static const String routeName = 'search_devices';

  const SearchDevicesScreen({super.key});

  @override
  State<SearchDevicesScreen> createState() => _SearchDevicesScreenState();
}

class _SearchDevicesScreenState extends State<SearchDevicesScreen> {
  @override
  void initState() {
    BlocProvider.of<SearchBloc>(context)
        .add(const SearchForDeviceEvent(searchText: ''));
    super.initState();
  }

  DeviceListEntity? deviceListEntity;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state is SearchLoadedState) {
          deviceListEntity = state.devices;
        }
      },
      builder: (context, state) {
        if (state is SearchErrorState) {
          return ExceptionIndicator(onTryAgain: () {
            BlocProvider.of<SearchBloc>(context)
                .add(SearchForDeviceEvent(searchText: controller.text));
          });
        }
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: const Text('Search For Devices'),
          ),
          body: Column(
            children: [
              TextField(
                controller: controller,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  hintText: "Search",
                  suffixIcon: Icon(Icons.search),
                ),
                onSubmitted: (val) {
                  BlocProvider.of<SearchBloc>(context).add(
                    SearchForDeviceEvent(searchText: val),
                  );
                },
              ),
              Expanded(
                child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 27),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              DeviceDetailsScreen.routeName,
                              arguments: {
                                'device': deviceListEntity?.results[index]
                              });
                        },
                        child: DeviceCard(
                          device: deviceListEntity!.results[index],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 27,
                      );
                    },
                    itemCount: deviceListEntity?.results.length ?? 0),
              ),
            ],
          ),
        );
      },
    );
  }
}
